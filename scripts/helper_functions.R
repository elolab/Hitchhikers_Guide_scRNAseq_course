## Helper functions
celltypist <- function(object, ref_model = "Immune_All_Low.pkl", model_dir = "data") {
  require("reticulate")
  celltypist <- import("celltypist")
  random <- import("random")
  os <- import("os")
  sc <- import("scanpy")
  
  # Convert Seurat to Anndata 
  adata <- sceasy::convertFormat(as.SingleCellExperiment(object), from="sce", to="anndata", 
                                 main_layer="logcounts", drop_single_values=FALSE) 
  
  # Select model to use
  celltypist.models <- file.path(model_dir, "models")
  if (!dir.exists(celltypist.models)) dir.create(celltypist.models)
  model <- file.path(celltypist.models, ref_model) # check models available at: https://www.celltypist.org/models
  
  # Define models path (otherwise it attemps: '~/.celltypist/data/models')
  if (!os$path$isdir(os$path$dirname(model))) os$makedirs(os$path$dirname(model))
  celltypist$models$models_path=os$path$join(os$getcwd(), os$path$dirname(model)) 
  
  # Download CellTypist models 
  tryCatch(
    expr = {
      celltypist$models$download_models(force_update=TRUE, model=os$path$basename(model))
    }, 
    error = function(e) {
      message("\nCan't access CellTypist web server!\nAttempting to run analysis without updating reference, if this exists in the path provided.") 
    }
  )
  
  # Perform annotation: allow 'majority_voting' - most frequent cell type representing up to 50% 
  #of the labels of every cluster is assign to itself
  random$seed(1024) # try to set this seed for reproducibility
  predictions=celltypist$annotate(adata, model=os$path$basename(model), majority_voting=TRUE, 
                                  min_prop=0.5)
  stopifnot(row.names(predictions$predicted_labels) == colnames(object))
  object@meta.data[,colnames(predictions$predicted_labels)] <- predictions$predicted_labels
  return(object)
}