# ------------------------------------------------
# -- Config --------------------------------------
# ------------------------------------------------
mkdir -p lib/config/routes
touch lib/config/routes/app_routes.dart

mkdir -p lib/config/theme
touch lib/config/theme/app_theme.dart

# ------------------------------------------------
# -- Core --------------------------------------
# ------------------------------------------------
mkdir -p lib/core/constants
touch lib/core/constants/constants.dart

mkdir -p lib/core/usecases
touch lib/core/usecases/usecase.dart

mkdir -p lib/core/errors/
touch lib/core/errors/exception.dart
touch lib/core/errors/failure.dart

mkdir -p lib/core/params/
touch lib/core/params/params.dart

# ------------------------------------------------
# -- Feature data --------------------------------
# ------------------------------------------------
feat_name="template"

mkdir -p lib/features/${feat_name}/data/datasources/
mkdir -p lib/features/${feat_name}/data/datasources/local/
touch    lib/features/${feat_name}/data/datasources/local/template_database.dart
mkdir -p lib/features/${feat_name}/data/datasources/remote/
touch    lib/features/${feat_name}/data/datasources/remote/template_api_service.dart

mkdir -p lib/features/${feat_name}/data/models/
touch    lib/features/${feat_name}/data/models/templatemodel.dart

mkdir -p lib/features/${feat_name}/data/repository/
touch    lib/features/${feat_name}/data/repository/template_repository_impl.dart

# ------------------------------------------------
# -- Feature domain ------------------------------
# ------------------------------------------------
mkdir -p lib/features/${feat_name}/domain/entities/
touch    lib/features/${feat_name}/domain/entities/templateentity.dart

mkdir -p lib/features/${feat_name}/domain/repository/
touch    lib/features/${feat_name}/domain/repository/template_repository.dart

mkdir -p lib/features/${feat_name}/domain/usecases/
touch    lib/features/${feat_name}/domain/usecases/templateusecase.dart

# ------------------------------------------------
# -- Feature presentation ------------------------
# ------------------------------------------------
mkdir -p lib/features/${feat_name}/presentation/providers/
touch    lib/features/${feat_name}/presentation/providers/template_provider.dart

mkdir -p lib/features/${feat_name}/presentation/pages/
touch    lib/features/${feat_name}/presentation/pages/template_page.dart

mkdir -p lib/features/${feat_name}/presentation/widgets/
touch    lib/features/${feat_name}/presentation/widgets/widgets.dart
