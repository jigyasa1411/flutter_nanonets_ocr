// To parse this JSON data, do
//
//     final getModelByIdResponseModel = getModelByIdResponseModelFromJson(jsonString);

import 'dart:convert';

GetModelByIdResponseModel getModelByIdResponseModelFromJson(String str) =>
    GetModelByIdResponseModel.fromJson(json.decode(str));

String getModelByIdResponseModelToJson(GetModelByIdResponseModel data) =>
    json.encode(data.toJson());

/// [GetModelByIdResponseModel] is the model class that needs to be used when we want to get a particular model's details
/// like name, type, accuracy etc.
class GetModelByIdResponseModel {
  String? modelId;
  String? modelType;
  int? state;
  String? status;
  double? accuracy;
  List<Category>? categories;
  String? email;
  bool? isPublic;
  List<TableCategory>? tableCategories;
  Metadata? metadata;
  PretrainedModelMetadata? pretrainedModelMetadata;
  bool? isPaid;
  PostprocessingFlags? postprocessingFlags;

  GetModelByIdResponseModel({
    this.modelId,
    this.modelType,
    this.state,
    this.status,
    this.accuracy,
    this.categories,
    this.email,
    this.isPublic,
    this.tableCategories,
    this.metadata,
    this.pretrainedModelMetadata,
    this.isPaid,
    this.postprocessingFlags,
  });

  factory GetModelByIdResponseModel.fromJson(Map<String, dynamic> json) =>
      GetModelByIdResponseModel(
        modelId: json["model_id"] ?? "",
        modelType: json["model_type"] ?? "",
        state: json["state"] ?? 0,
        status: json["status"] ?? "",
        accuracy: json["accuracy"].toDouble() ?? 0.0,
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        email: json["email"],
        isPublic: json["is_public"],
        tableCategories: List<TableCategory>.from(
            json["table_categories"].map((x) => TableCategory.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
        pretrainedModelMetadata:
            PretrainedModelMetadata.fromJson(json["pretrained_model_metadata"]),
        isPaid: json["is_paid"] ?? false,
        postprocessingFlags: json["postprocessing_flags"] != null
            ? PostprocessingFlags.fromJson(json["postprocessing_flags"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "model_id": modelId,
        "model_type": modelType,
        "state": state,
        "status": status,
        "accuracy": accuracy,
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "email": email,
        "is_public": isPublic,
        "table_categories":
            List<dynamic>.from(tableCategories!.map((x) => x.toJson())),
        "metadata": metadata!.toJson(),
        "pretrained_model_metadata": pretrainedModelMetadata!.toJson(),
        "is_paid": isPaid,
        "postprocessing_flags": postprocessingFlags!.toJson(),
      };
}

/// [Category] class will be used to get details about each category of the model.
class Category {
  String? name;
  int? count;
  String? id;
  String? routing;
  bool? currentlyRenaming;
  String? description;

  Category({
    this.name,
    this.count,
    this.id,
    this.routing,
    this.currentlyRenaming,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"] ?? "",
        count: json["count"] ?? 0,
        id: json["id"] ?? "",
        routing: json["routing"] ?? "",
        currentlyRenaming: json["currently_renaming"] ?? false,
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "count": count,
        "id": id,
        "routing": routing,
        "currently_renaming": currentlyRenaming,
        "description": description,
      };
}

class Metadata {
  dynamic croppedRotatedExperimentMetadata;
  bool? useCroppedRotatedExperiment;
  String? parentModelId;
  bool? isCroppedRotatedDatasetDirty;
  String? customModelName;
  String? customModelResponseType;
  bool? extractTables;
  bool? mapInvoiceLineItems;
  bool? showCropImagesOnRhs;
  bool? entirePageText;
  bool? documentLevelSearch;
  List<TableCategory>? tableCategories;
  dynamic featureFlags;
  String? gcnOverrideConfig;
  MetadataExportInfo? exportInfo;
  String? storagePermission;
  bool? lightExperiments;
  bool? boxInBoxTable;
  CapturedDataView? capturedDataView;
  bool? appendFromEmailToFile;
  bool? processEmailWithNoAttachment;
  bool? storeEmailDataInInference;
  String? onRetrainOnlyHostedExp;
  bool? uploadImageToS3Sync;
  bool? showEmptyPrediction;
  int? showEmptyPredictionThreshold;
  RenameConfig? fileRenameConfig;
  int? bulkAsyncThreshold;
  bool? tablesFound;
  int? invoiceLineItemModelVersion;
  String? overrideAsyncQueue;
  bool? disableSyncLimitThrottling;
  bool? useTranslate;
  bool? useMaps;
  bool? useOpenai;
  int? usageSoftThresholdForStripe;
  StripeSoftThresholdInfo? stripeSoftThresholdInfo;
  int? minEmailUploadSize;
  dynamic fileTypesNotAllowed;
  bool? zeroShotFallback;
  OneShotPromptInfo? oneShotPromptInfo;
  LlmModelMetadata? llmModelMetadata;

  Metadata({
    this.croppedRotatedExperimentMetadata,
    this.useCroppedRotatedExperiment,
    this.parentModelId,
    this.isCroppedRotatedDatasetDirty,
    this.customModelName,
    this.customModelResponseType,
    this.extractTables,
    this.mapInvoiceLineItems,
    this.showCropImagesOnRhs,
    this.entirePageText,
    this.documentLevelSearch,
    this.tableCategories,
    this.featureFlags,
    this.gcnOverrideConfig,
    this.exportInfo,
    this.storagePermission,
    this.lightExperiments,
    this.boxInBoxTable,
    this.capturedDataView,
    this.appendFromEmailToFile,
    this.processEmailWithNoAttachment,
    this.storeEmailDataInInference,
    this.onRetrainOnlyHostedExp,
    this.uploadImageToS3Sync,
    this.showEmptyPrediction,
    this.showEmptyPredictionThreshold,
    this.fileRenameConfig,
    this.bulkAsyncThreshold,
    this.tablesFound,
    this.invoiceLineItemModelVersion,
    this.overrideAsyncQueue,
    this.disableSyncLimitThrottling,
    this.useTranslate,
    this.useMaps,
    this.useOpenai,
    this.usageSoftThresholdForStripe,
    this.stripeSoftThresholdInfo,
    this.minEmailUploadSize,
    this.fileTypesNotAllowed,
    this.zeroShotFallback,
    this.oneShotPromptInfo,
    this.llmModelMetadata,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        croppedRotatedExperimentMetadata:
            json["cropped_rotated_experiment_metadata"],
        useCroppedRotatedExperiment: json["use_cropped_rotated_experiment"],
        parentModelId: json["parent_model_id"],
        isCroppedRotatedDatasetDirty: json["is_cropped_rotated_dataset_dirty"],
        customModelName: json["custom_model_name"],
        customModelResponseType: json["custom_model_response_type"],
        extractTables: json["extract_tables"],
        mapInvoiceLineItems: json["map_invoice_line_items"],
        showCropImagesOnRhs: json["show_crop_images_on_rhs"],
        entirePageText: json["entire_page_text"],
        documentLevelSearch: json["document_level_search"],
        tableCategories: List<TableCategory>.from(
            json["table_categories"].map((x) => TableCategory.fromJson(x))),
        featureFlags: json["feature_flags"],
        gcnOverrideConfig: json["gcn_override_config"],
        exportInfo: MetadataExportInfo.fromJson(json["export_info"]),
        storagePermission: json["storage_permission"],
        lightExperiments: json["light_experiments"],
        boxInBoxTable: json["box_in_box_table"],
        capturedDataView: CapturedDataView.fromJson(json["captured_data_view"]),
        appendFromEmailToFile: json["append_from_email_to_file"],
        processEmailWithNoAttachment: json["process_email_with_no_attachment"],
        storeEmailDataInInference: json["store_email_data_in_inference"],
        onRetrainOnlyHostedExp: json["on_retrain_only_hosted_exp"],
        uploadImageToS3Sync: json["upload_image_to_s3_sync"],
        showEmptyPrediction: json["show_empty_prediction"],
        showEmptyPredictionThreshold: json["show_empty_prediction_threshold"],
        fileRenameConfig: RenameConfig.fromJson(json["file_rename_config"]),
        bulkAsyncThreshold: json["bulk_async_threshold"],
        tablesFound: json["tables_found"],
        invoiceLineItemModelVersion: json["invoice_line_item_model_version"],
        overrideAsyncQueue: json["override_async_queue"],
        disableSyncLimitThrottling: json["disable_sync_limit_throttling"],
        useTranslate: json["use_translate"],
        useMaps: json["use_maps"],
        useOpenai: json["use_openai"],
        usageSoftThresholdForStripe: json["usage_soft_threshold_for_stripe"],
        stripeSoftThresholdInfo: StripeSoftThresholdInfo.fromJson(
            json["stripe_soft_threshold_info"]),
        minEmailUploadSize: json["min_email_upload_size"],
        fileTypesNotAllowed: json["file_types_not_allowed"],
        zeroShotFallback: json["zero_shot_fallback"],
        oneShotPromptInfo:
            OneShotPromptInfo.fromJson(json["one_shot_prompt_info"]),
        llmModelMetadata: LlmModelMetadata.fromJson(json["llm_model_metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "cropped_rotated_experiment_metadata": croppedRotatedExperimentMetadata,
        "use_cropped_rotated_experiment": useCroppedRotatedExperiment,
        "parent_model_id": parentModelId,
        "is_cropped_rotated_dataset_dirty": isCroppedRotatedDatasetDirty,
        "custom_model_name": customModelName,
        "custom_model_response_type": customModelResponseType,
        "extract_tables": extractTables,
        "map_invoice_line_items": mapInvoiceLineItems,
        "show_crop_images_on_rhs": showCropImagesOnRhs,
        "entire_page_text": entirePageText,
        "document_level_search": documentLevelSearch,
        "table_categories":
            List<dynamic>.from(tableCategories!.map((x) => x.toJson())),
        "feature_flags": featureFlags,
        "gcn_override_config": gcnOverrideConfig,
        "export_info": exportInfo?.toJson(),
        "storage_permission": storagePermission,
        "light_experiments": lightExperiments,
        "box_in_box_table": boxInBoxTable,
        "captured_data_view": capturedDataView?.toJson(),
        "append_from_email_to_file": appendFromEmailToFile,
        "process_email_with_no_attachment": processEmailWithNoAttachment,
        "store_email_data_in_inference": storeEmailDataInInference,
        "on_retrain_only_hosted_exp": onRetrainOnlyHostedExp,
        "upload_image_to_s3_sync": uploadImageToS3Sync,
        "show_empty_prediction": showEmptyPrediction,
        "show_empty_prediction_threshold": showEmptyPredictionThreshold,
        "file_rename_config": fileRenameConfig?.toJson(),
        "bulk_async_threshold": bulkAsyncThreshold,
        "tables_found": tablesFound,
        "invoice_line_item_model_version": invoiceLineItemModelVersion,
        "override_async_queue": overrideAsyncQueue,
        "disable_sync_limit_throttling": disableSyncLimitThrottling,
        "use_translate": useTranslate,
        "use_maps": useMaps,
        "use_openai": useOpenai,
        "usage_soft_threshold_for_stripe": usageSoftThresholdForStripe,
        "stripe_soft_threshold_info": stripeSoftThresholdInfo?.toJson(),
        "min_email_upload_size": minEmailUploadSize,
        "file_types_not_allowed": fileTypesNotAllowed,
        "zero_shot_fallback": zeroShotFallback,
        "one_shot_prompt_info": oneShotPromptInfo?.toJson(),
        "llm_model_metadata": llmModelMetadata?.toJson(),
      };
}

class CapturedDataView {
  bool? isSet;
  dynamic fileInfo;
  dynamic fields;
  dynamic options;

  CapturedDataView({
    this.isSet,
    this.fileInfo,
    this.fields,
    this.options,
  });

  factory CapturedDataView.fromJson(Map<String, dynamic> json) =>
      CapturedDataView(
        isSet: json["is_set"],
        fileInfo: json["file_info"],
        fields: json["fields"],
        options: json["options"],
      );

  Map<String, dynamic> toJson() => {
        "is_set": isSet,
        "file_info": fileInfo,
        "fields": fields,
        "options": options,
      };
}

class MetadataExportInfo {
  bool? isExportEnabledOnInference;
  bool? isExportEnabledOnVerification;
  bool? isExportEnabledOnPassingAllReviewStages;
  String? action;
  String? integrationId;
  dynamic fieldMapping;
  ExportMetadata? exportMetadata;
  String? name;
  String? type;
  bool? isDocLevelExportEnabled;
  String? exportId;
  ConditionalConfig? conditionalConfig;
  String? exportCategory;
  GenericBlockInfo? genericBlockInfo;

  MetadataExportInfo({
    this.isExportEnabledOnInference,
    this.isExportEnabledOnVerification,
    this.isExportEnabledOnPassingAllReviewStages,
    this.action,
    this.integrationId,
    this.fieldMapping,
    this.exportMetadata,
    this.name,
    this.type,
    this.isDocLevelExportEnabled,
    this.exportId,
    this.conditionalConfig,
    this.exportCategory,
    this.genericBlockInfo,
  });

  factory MetadataExportInfo.fromJson(Map<String, dynamic> json) =>
      MetadataExportInfo(
        isExportEnabledOnInference: json["is_export_enabled_on_inference"],
        isExportEnabledOnVerification:
            json["is_export_enabled_on_verification"],
        isExportEnabledOnPassingAllReviewStages:
            json["is_export_enabled_on_passing_all_review_stages"],
        action: json["action"],
        integrationId: json["integration_id"],
        fieldMapping: json["field_mapping"],
        exportMetadata: ExportMetadata.fromJson(json["export_metadata"]),
        name: json["name"],
        type: json["type"],
        isDocLevelExportEnabled: json["is_doc_level_export_enabled"],
        exportId: json["export_id"],
        conditionalConfig:
            ConditionalConfig.fromJson(json["conditional_config"]),
        exportCategory: json["export_category"],
        genericBlockInfo: GenericBlockInfo.fromJson(json["generic_block_info"]),
      );

  Map<String, dynamic> toJson() => {
        "is_export_enabled_on_inference": isExportEnabledOnInference,
        "is_export_enabled_on_verification": isExportEnabledOnVerification,
        "is_export_enabled_on_passing_all_review_stages":
            isExportEnabledOnPassingAllReviewStages,
        "action": action,
        "integration_id": integrationId,
        "field_mapping": fieldMapping,
        "export_metadata": exportMetadata?.toJson(),
        "name": name,
        "type": type,
        "is_doc_level_export_enabled": isDocLevelExportEnabled,
        "export_id": exportId,
        "conditional_config": conditionalConfig?.toJson(),
        "export_category": exportCategory,
        "generic_block_info": genericBlockInfo?.toJson(),
      };
}

class ConditionalConfig {
  dynamic conditions;
  Setting? setting;

  ConditionalConfig({
    this.conditions,
    this.setting,
  });

  factory ConditionalConfig.fromJson(Map<String, dynamic> json) =>
      ConditionalConfig(
        conditions: json["conditions"],
        setting: Setting.fromJson(json["setting"]),
      );

  Map<String, dynamic> toJson() => {
        "conditions": conditions,
        "setting": setting?.toJson(),
      };
}

class Setting {
  String? processingType;
  String? operationType;

  Setting({
    this.processingType,
    this.operationType,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        processingType: json["processing_type"],
        operationType: json["operation_type"],
      );

  Map<String, dynamic> toJson() => {
        "processing_type": processingType,
        "operation_type": operationType,
      };
}

class ExportMetadata {
  String? tableName;
  String? scriptContent;
  String? organization;
  bool? useUnlabelledTableHeaders;
  FileNameSettings? fileNameSettings;
  bool? docLevelResult;

  ExportMetadata({
    this.tableName,
    this.scriptContent,
    this.organization,
    this.useUnlabelledTableHeaders,
    this.fileNameSettings,
    this.docLevelResult,
  });

  factory ExportMetadata.fromJson(Map<String, dynamic> json) => ExportMetadata(
        tableName: json["table_name"],
        scriptContent: json["script_content"],
        organization: json["organization"],
        useUnlabelledTableHeaders: json["use_unlabelled_table_headers"],
        fileNameSettings: FileNameSettings.fromJson(json["file_name_settings"]),
        docLevelResult: json["doc_level_result"],
      );

  Map<String, dynamic> toJson() => {
        "table_name": tableName,
        "script_content": scriptContent,
        "organization": organization,
        "use_unlabelled_table_headers": useUnlabelledTableHeaders,
        "file_name_settings": fileNameSettings?.toJson(),
        "doc_level_result": docLevelResult,
      };
}

class FileNameSettings {
  String? renameType;
  RenameConfig? dynamicRenameConfig;

  FileNameSettings({
    this.renameType,
    this.dynamicRenameConfig,
  });

  factory FileNameSettings.fromJson(Map<String, dynamic> json) =>
      FileNameSettings(
        renameType: json["rename_type"],
        dynamicRenameConfig:
            RenameConfig.fromJson(json["dynamic_rename_config"]),
      );

  Map<String, dynamic> toJson() => {
        "rename_type": renameType,
        "dynamic_rename_config": dynamicRenameConfig?.toJson(),
      };
}

class RenameConfig {
  dynamic fields;

  RenameConfig({
    this.fields,
  });

  factory RenameConfig.fromJson(Map<String, dynamic> json) => RenameConfig(
        fields: json["fields"],
      );

  Map<String, dynamic> toJson() => {
        "fields": fields,
      };
}

class GenericBlockInfo {
  String? blockType;
  String? id;
  String? prevStepId;
  String? authenticationType;
  OauthInfo? oauthInfo;
  String? accountName;
  InputInfo? inputInfo;
  ConditionalConfig? conditionalConfig;
  bool? isExport;
  GenericBlockInfoExportInfo? exportInfo;

  GenericBlockInfo({
    this.blockType,
    this.id,
    this.prevStepId,
    this.authenticationType,
    this.oauthInfo,
    this.accountName,
    this.inputInfo,
    this.conditionalConfig,
    this.isExport,
    this.exportInfo,
  });

  factory GenericBlockInfo.fromJson(Map<String, dynamic> json) =>
      GenericBlockInfo(
        blockType: json["block_type"],
        id: json["id"],
        prevStepId: json["prev_step_id"],
        authenticationType: json["authentication_type"],
        oauthInfo: OauthInfo.fromJson(json["oauth_info"]),
        accountName: json["account_name"],
        inputInfo: InputInfo.fromJson(json["input_info"]),
        conditionalConfig:
            ConditionalConfig.fromJson(json["conditional_config"]),
        isExport: json["is_export"],
        exportInfo: GenericBlockInfoExportInfo.fromJson(json["export_info"]),
      );

  Map<String, dynamic> toJson() => {
        "block_type": blockType,
        "id": id,
        "prev_step_id": prevStepId,
        "authentication_type": authenticationType,
        "oauth_info": oauthInfo?.toJson(),
        "account_name": accountName,
        "input_info": inputInfo?.toJson(),
        "conditional_config": conditionalConfig?.toJson(),
        "is_export": isExport,
        "export_info": exportInfo?.toJson(),
      };
}

class GenericBlockInfoExportInfo {
  bool? isExportEnabledOnInference;
  bool? isExportEnabledOnVerification;
  bool? isExportEnabledOnPassingAllReviewStages;
  bool? isDocLevelExportEnabled;
  String? action;

  GenericBlockInfoExportInfo({
    this.isExportEnabledOnInference,
    this.isExportEnabledOnVerification,
    this.isExportEnabledOnPassingAllReviewStages,
    this.isDocLevelExportEnabled,
    this.action,
  });

  factory GenericBlockInfoExportInfo.fromJson(Map<String, dynamic> json) =>
      GenericBlockInfoExportInfo(
        isExportEnabledOnInference: json["is_export_enabled_on_inference"],
        isExportEnabledOnVerification:
            json["is_export_enabled_on_verification"],
        isExportEnabledOnPassingAllReviewStages:
            json["is_export_enabled_on_passing_all_review_stages"],
        isDocLevelExportEnabled: json["is_doc_level_export_enabled"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "is_export_enabled_on_inference": isExportEnabledOnInference,
        "is_export_enabled_on_verification": isExportEnabledOnVerification,
        "is_export_enabled_on_passing_all_review_stages":
            isExportEnabledOnPassingAllReviewStages,
        "is_doc_level_export_enabled": isDocLevelExportEnabled,
        "action": action,
      };
}

class InputInfo {
  dynamic params;
  int? currentIndex;
  bool? paramsFinal;
  HeaderDescriptions? validations;

  InputInfo({
    this.params,
    this.currentIndex,
    this.paramsFinal,
    this.validations,
  });

  factory InputInfo.fromJson(Map<String, dynamic> json) => InputInfo(
        params: json["params"],
        currentIndex: json["current_index"],
        paramsFinal: json["params_final"],
        validations: HeaderDescriptions.fromJson(json["validations"]),
      );

  Map<String, dynamic> toJson() => {
        "params": params,
        "current_index": currentIndex,
        "params_final": paramsFinal,
        "validations": validations?.toJson(),
      };
}

class HeaderDescriptions {
  HeaderDescriptions();

  factory HeaderDescriptions.fromJson(Map<String, dynamic> json) =>
      HeaderDescriptions();

  Map<String, dynamic> toJson() => {};
}

class OauthInfo {
  bool? active;
  String? service;
  String? authenticationUrl;
  String? vendorName;

  OauthInfo({
    this.active,
    this.service,
    this.authenticationUrl,
    this.vendorName,
  });

  factory OauthInfo.fromJson(Map<String, dynamic> json) => OauthInfo(
        active: json["active"],
        service: json["service"],
        authenticationUrl: json["authentication_url"],
        vendorName: json["vendor_name"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "service": service,
        "authentication_url": authenticationUrl,
        "vendor_name": vendorName,
      };
}

class LlmModelMetadata {
  String? fieldModel;
  String? tableModel;

  LlmModelMetadata({
    this.fieldModel,
    this.tableModel,
  });

  factory LlmModelMetadata.fromJson(Map<String, dynamic> json) =>
      LlmModelMetadata(
        fieldModel: json["field_model"],
        tableModel: json["table_model"],
      );

  Map<String, dynamic> toJson() => {
        "field_model": fieldModel,
        "table_model": tableModel,
      };
}

class OneShotPromptInfo {
  String? aboutDocument;
  String? extractValues;
  String? formatResponse;
  String? sampleDocuments;
  String? noOfSampleDocuments;

  OneShotPromptInfo({
    this.aboutDocument,
    this.extractValues,
    this.formatResponse,
    this.sampleDocuments,
    this.noOfSampleDocuments,
  });

  factory OneShotPromptInfo.fromJson(Map<String, dynamic> json) =>
      OneShotPromptInfo(
        aboutDocument: json["about_document"],
        extractValues: json["extract_values"],
        formatResponse: json["format_response"],
        sampleDocuments: json["sample_documents"],
        noOfSampleDocuments: json["no_of_sample_documents"],
      );

  Map<String, dynamic> toJson() => {
        "about_document": aboutDocument,
        "extract_values": extractValues,
        "format_response": formatResponse,
        "sample_documents": sampleDocuments,
        "no_of_sample_documents": noOfSampleDocuments,
      };
}

class StripeSoftThresholdInfo {
  bool? paymentFailed;
  DateTime? cycleStartDate;
  int? softThresholdValue;
  DateTime? chargedOn;
  int? chargedForUsage;
  dynamic paymentFailureError;
  String? chargeId;

  StripeSoftThresholdInfo({
    this.paymentFailed,
    this.cycleStartDate,
    this.softThresholdValue,
    this.chargedOn,
    this.chargedForUsage,
    this.paymentFailureError,
    this.chargeId,
  });

  factory StripeSoftThresholdInfo.fromJson(Map<String, dynamic> json) =>
      StripeSoftThresholdInfo(
        paymentFailed: json["payment_failed"],
        cycleStartDate: DateTime.parse(json["cycle_start_date"]),
        softThresholdValue: json["soft_threshold_value"],
        chargedOn: DateTime.parse(json["charged_on"]),
        chargedForUsage: json["charged_for_usage"],
        paymentFailureError: json["payment_failure_error"],
        chargeId: json["charge_id"],
      );

  Map<String, dynamic> toJson() => {
        "payment_failed": paymentFailed,
        "cycle_start_date": cycleStartDate?.toIso8601String(),
        "soft_threshold_value": softThresholdValue,
        "charged_on": chargedOn?.toIso8601String(),
        "charged_for_usage": chargedForUsage,
        "payment_failure_error": paymentFailureError,
        "charge_id": chargeId,
      };
}

class TableCategory {
  String? label;
  List<dynamic>? headers;
  HeaderDescriptions? headersCount;
  HeaderDescriptions? idInfo;
  HeaderDescriptions? headersBeingRenamed;
  HeaderDescriptions? headerDescriptions;

  TableCategory({
    this.label,
    this.headers,
    this.headersCount,
    this.idInfo,
    this.headersBeingRenamed,
    this.headerDescriptions,
  });

  factory TableCategory.fromJson(Map<String, dynamic> json) => TableCategory(
        label: json["label"],
        headers: List<dynamic>.from(json["headers"].map((x) => x)),
        headersCount: HeaderDescriptions.fromJson(json["headers_count"]),
        idInfo: HeaderDescriptions.fromJson(json["id_info"]),
        headersBeingRenamed:
            HeaderDescriptions.fromJson(json["headers_being_renamed"]),
        headerDescriptions:
            HeaderDescriptions.fromJson(json["header_descriptions"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "headers": List<dynamic>.from(headers!.map((x) => x)),
        "headers_count": headersCount?.toJson(),
        "id_info": idInfo?.toJson(),
        "headers_being_renamed": headersBeingRenamed?.toJson(),
        "header_descriptions": headerDescriptions?.toJson(),
      };
}

class PostprocessingFlags {
  bool? enabled;
  bool? validationEnabled;

  PostprocessingFlags({
    this.enabled,
    this.validationEnabled,
  });

  factory PostprocessingFlags.fromJson(Map<String, dynamic> json) =>
      PostprocessingFlags(
        enabled: json["enabled"],
        validationEnabled: json["validation_enabled"],
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "validation_enabled": validationEnabled,
      };
}

class PretrainedModelMetadata {
  String? modelId;
  bool? clonedFromPretrained;
  String? architecture;
  String? checkpoint;
  bool? modelRetrainedAfterCloning;
  OcrExperimentMap? ocrExperimentMap;
  bool? isTablePretrainedModel;
  String? sampleImageId;
  String? clonedFromModelId;

  PretrainedModelMetadata({
    this.modelId,
    this.clonedFromPretrained,
    this.architecture,
    this.checkpoint,
    this.modelRetrainedAfterCloning,
    this.ocrExperimentMap,
    this.isTablePretrainedModel,
    this.sampleImageId,
    this.clonedFromModelId,
  });

  factory PretrainedModelMetadata.fromJson(Map<String, dynamic> json) =>
      PretrainedModelMetadata(
        modelId: json["model_id"] ?? "",
        clonedFromPretrained: json["cloned_from_pretrained"] ?? false,
        architecture: json["architecture"] ?? "",
        checkpoint: json["checkpoint"] ?? "",
        modelRetrainedAfterCloning:
            json["model_retrained_after_cloning"] ?? false,
        ocrExperimentMap: json["ocr_experiment_map"] != null
            ? OcrExperimentMap.fromJson(json["ocr_experiment_map"])
            : null,
        isTablePretrainedModel: json["is_table_pretrained_model"] ?? false,
        sampleImageId: json["sample_image_id"] ?? "",
        clonedFromModelId: json["cloned_from_model_id"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "model_id": modelId,
        "cloned_from_pretrained": clonedFromPretrained,
        "architecture": architecture,
        "checkpoint": checkpoint,
        "model_retrained_after_cloning": modelRetrainedAfterCloning,
        "ocr_experiment_map": ocrExperimentMap?.toJson(),
        "is_table_pretrained_model": isTablePretrainedModel,
        "sample_image_id": sampleImageId,
        "cloned_from_model_id": clonedFromModelId,
      };
}

class OcrExperimentMap {
  String? main;

  OcrExperimentMap({
    this.main,
  });

  factory OcrExperimentMap.fromJson(Map<String, dynamic> json) =>
      OcrExperimentMap(
        main: json["main"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "main": main,
      };
}
