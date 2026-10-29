-- PC CRM Core CRM Entities (Schema + Dummy Data)

-- ========================================================
-- Table `tabActivity Log`
-- ========================================================
CREATE TABLE `tabActivity Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `subject` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `communication_date` datetime(6) DEFAULT NULL,
  `ip_address` varchar(140) DEFAULT NULL,
  `operation` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `reference_owner` varchar(140) DEFAULT NULL,
  `timeline_doctype` varchar(140) DEFAULT NULL,
  `timeline_name` varchar(140) DEFAULT NULL,
  `link_doctype` varchar(140) DEFAULT NULL,
  `link_name` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `full_name` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `_seen` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `reference_doctype_reference_name_index` (`reference_doctype`,`reference_name`),
  KEY `timeline_doctype_timeline_name_index` (`timeline_doctype`,`timeline_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabActivity Log` VALUES


-- ========================================================
-- Table `tabCRM Call Log`
-- ========================================================
CREATE TABLE `tabCRM Call Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `telephony_medium` varchar(140) DEFAULT NULL,
  `id` varchar(140) DEFAULT NULL,
  `from` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT NULL,
  `duration` decimal(21,9) DEFAULT NULL,
  `medium` varchar(140) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT 'CRM Lead',
  `reference_docname` varchar(140) DEFAULT NULL,
  `to` varchar(140) DEFAULT NULL,
  `type` varchar(140) DEFAULT NULL,
  `receiver` varchar(140) DEFAULT NULL,
  `caller` varchar(140) DEFAULT NULL,
  `recording_url` text DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `note` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Call Log` VALUES


-- ========================================================
-- Table `tabCRM Communication Status`
-- ========================================================
CREATE TABLE `tabCRM Communication Status` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `status` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `status` (`status`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Communication Status` VALUES


-- ========================================================
-- Table `tabCRM Contacts`
-- ========================================================
CREATE TABLE `tabCRM Contacts` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `contact` varchar(140) DEFAULT NULL,
  `full_name` varchar(140) DEFAULT NULL,
  `email` varchar(140) DEFAULT NULL,
  `gender` varchar(140) DEFAULT NULL,
  `mobile_no` varchar(140) DEFAULT NULL,
  `phone` varchar(140) DEFAULT NULL,
  `is_primary` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Contacts` VALUES


-- ========================================================
-- Table `tabCRM Dashboard`
-- ========================================================
CREATE TABLE `tabCRM Dashboard` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `private` int(1) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `layout` longtext DEFAULT '[]',
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `title` (`title`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Dashboard` VALUES


-- ========================================================
-- Table `tabCRM Deal`
-- ========================================================
CREATE TABLE `tabCRM Deal` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `naming_series` varchar(140) DEFAULT 'CRM-DEAL-.YYYY.-',
  `organization` varchar(140) DEFAULT NULL,
  `next_step` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT NULL,
  `deal_owner` varchar(140) DEFAULT NULL,
  `probability` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `expected_deal_value` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `deal_value` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `expected_closure_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `contact` varchar(140) DEFAULT NULL,
  `lead` varchar(140) DEFAULT NULL,
  `source` varchar(140) DEFAULT NULL,
  `lead_name` varchar(140) DEFAULT NULL,
  `organization_name` varchar(140) DEFAULT NULL,
  `website` varchar(140) DEFAULT NULL,
  `organization_logo` text DEFAULT NULL,
  `company_description` text DEFAULT NULL,
  `linkedin` varchar(140) DEFAULT NULL,
  `twitter` varchar(140) DEFAULT NULL,
  `facebook` varchar(140) DEFAULT NULL,
  `no_of_employees` varchar(140) DEFAULT NULL,
  `job_title` varchar(140) DEFAULT NULL,
  `territory` varchar(140) DEFAULT NULL,
  `currency` varchar(140) DEFAULT NULL,
  `exchange_rate` decimal(21,9) NOT NULL DEFAULT 1.000000000,
  `annual_revenue` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `industry` varchar(140) DEFAULT NULL,
  `salutation` varchar(140) DEFAULT NULL,
  `first_name` varchar(140) DEFAULT NULL,
  `last_name` varchar(140) DEFAULT NULL,
  `email` varchar(140) DEFAULT NULL,
  `mobile_no` varchar(140) DEFAULT NULL,
  `phone` varchar(140) DEFAULT NULL,
  `gender` varchar(140) DEFAULT NULL,
  `total` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `net_total` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `sla` varchar(140) DEFAULT NULL,
  `sla_creation` datetime(6) DEFAULT NULL,
  `sla_status` varchar(140) DEFAULT NULL,
  `communication_status` varchar(140) DEFAULT 'Open',
  `response_by` datetime(6) DEFAULT NULL,
  `first_response_time` decimal(21,9) DEFAULT NULL,
  `first_responded_on` datetime(6) DEFAULT NULL,
  `last_response_time` decimal(21,9) DEFAULT NULL,
  `last_responded_on` datetime(6) DEFAULT NULL,
  `lost_reason` varchar(140) DEFAULT NULL,
  `lost_notes` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `_seen` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `status` (`status`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Deal` VALUES


-- ========================================================
-- Table `tabCRM Deal Status`
-- ========================================================
CREATE TABLE `tabCRM Deal Status` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `deal_status` varchar(140) DEFAULT NULL,
  `type` varchar(140) DEFAULT 'Open',
  `position` int(11) NOT NULL DEFAULT 0,
  `probability` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `color` varchar(140) DEFAULT 'gray',
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `deal_status` (`deal_status`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Deal Status` VALUES


-- ========================================================
-- Table `tabCRM Dropdown Item`
-- ========================================================
CREATE TABLE `tabCRM Dropdown Item` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `name1` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `type` varchar(140) DEFAULT NULL,
  `route` varchar(140) DEFAULT NULL,
  `open_in_new_window` int(1) NOT NULL DEFAULT 1,
  `hidden` int(1) NOT NULL DEFAULT 0,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `icon` longtext DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name1` (`name1`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Dropdown Item` VALUES


-- ========================================================
-- Table `tabCRM Enrichment Domain`
-- ========================================================
CREATE TABLE `tabCRM Enrichment Domain` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `domain` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Enrichment Field Mapping`
-- ========================================================
CREATE TABLE `tabCRM Enrichment Field Mapping` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `source_key` varchar(140) DEFAULT NULL,
  `target_doctype` varchar(140) DEFAULT NULL,
  `target_fieldname` varchar(140) DEFAULT NULL,
  `write_policy` varchar(140) DEFAULT 'Fill if empty',
  `create_missing_link` int(1) NOT NULL DEFAULT 0,
  `default_values` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Enrichment Field Mapping` VALUES


-- ========================================================
-- Table `tabCRM Enrichment Link Priority`
-- ========================================================
CREATE TABLE `tabCRM Enrichment Link Priority` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `keyword` varchar(140) DEFAULT NULL,
  `weight` decimal(21,9) NOT NULL DEFAULT 1.000000000,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Enrichment Link Priority` VALUES


-- ========================================================
-- Table `tabCRM Enrichment Rule`
-- ========================================================
CREATE TABLE `tabCRM Enrichment Rule` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `rule_name` varchar(140) DEFAULT NULL,
  `rule_type` varchar(140) DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `target_value` varchar(140) DEFAULT NULL,
  `industry` varchar(140) DEFAULT NULL,
  `weight` decimal(21,9) NOT NULL DEFAULT 1.000000000,
  `match_scope` varchar(140) DEFAULT 'Full Text',
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Enrichment Rule` VALUES


-- ========================================================
-- Table `tabCRM Enrichment Rule Pattern`
-- ========================================================
CREATE TABLE `tabCRM Enrichment Rule Pattern` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `pattern` varchar(140) DEFAULT NULL,
  `is_regex` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Enrichment Rule Pattern` VALUES


-- ========================================================
-- Table `tabCRM Enrichment Run`
-- ========================================================
CREATE TABLE `tabCRM Enrichment Run` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT 'Queued',
  `source_website` varchar(140) DEFAULT NULL,
  `started_on` datetime(6) DEFAULT NULL,
  `finished_on` datetime(6) DEFAULT NULL,
  `undone_on` datetime(6) DEFAULT NULL,
  `undone_by` varchar(140) DEFAULT NULL,
  `company_name` varchar(140) DEFAULT NULL,
  `industry` varchar(140) DEFAULT NULL,
  `industry_confidence` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `emails_found` int(11) NOT NULL DEFAULT 0,
  `phones_found` int(11) NOT NULL DEFAULT 0,
  `social_profiles` text DEFAULT NULL,
  `raw_json` longtext DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Enrichment Run` VALUES


-- ========================================================
-- Table `tabCRM Enrichment Run Change`
-- ========================================================
CREATE TABLE `tabCRM Enrichment Run Change` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `fieldname` varchar(140) DEFAULT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Enrichment Skip Pattern`
-- ========================================================
CREATE TABLE `tabCRM Enrichment Skip Pattern` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `pattern` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Fields Layout`
-- ========================================================
CREATE TABLE `tabCRM Fields Layout` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `dt` varchar(140) DEFAULT NULL,
  `type` varchar(140) DEFAULT NULL,
  `layout` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Fields Layout` VALUES


-- ========================================================
-- Table `tabCRM Form Script`
-- ========================================================
CREATE TABLE `tabCRM Form Script` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `dt` varchar(140) DEFAULT NULL,
  `view` varchar(140) DEFAULT 'Form',
  `enabled` int(1) NOT NULL DEFAULT 0,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `script` longtext DEFAULT 'function setupForm({ doc }) {\n    return {\n        actions: [],\n    }\n}',
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Form Script` VALUES


-- ========================================================
-- Table `tabCRM Global Settings`
-- ========================================================
CREATE TABLE `tabCRM Global Settings` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `dt` varchar(140) DEFAULT 'DocType',
  `type` varchar(140) DEFAULT NULL,
  `json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json`)),
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Global Settings` VALUES


-- ========================================================
-- Table `tabCRM Holiday`
-- ========================================================
CREATE TABLE `tabCRM Holiday` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `weekly_off` int(1) NOT NULL DEFAULT 0,
  `description` longtext DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Holiday List`
-- ========================================================
CREATE TABLE `tabCRM Holiday List` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `holiday_list_name` varchar(140) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `total_holidays` int(11) NOT NULL DEFAULT 0,
  `weekly_off` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `holiday_list_name` (`holiday_list_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Industry`
-- ========================================================
CREATE TABLE `tabCRM Industry` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `industry` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `industry` (`industry`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Industry` VALUES


-- ========================================================
-- Table `tabCRM Invitation`
-- ========================================================
CREATE TABLE `tabCRM Invitation` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email` varchar(140) DEFAULT NULL,
  `role` varchar(140) DEFAULT NULL,
  `key` varchar(140) DEFAULT NULL,
  `invited_by` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT NULL,
  `email_sent_at` datetime(6) DEFAULT NULL,
  `accepted_at` datetime(6) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Invitation` VALUES


-- ========================================================
-- Table `tabCRM Lead`
-- ========================================================
CREATE TABLE `tabCRM Lead` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `salutation` varchar(140) DEFAULT NULL,
  `first_name` varchar(140) DEFAULT NULL,
  `last_name` varchar(140) DEFAULT NULL,
  `lead_name` varchar(140) DEFAULT NULL,
  `email` varchar(140) DEFAULT NULL,
  `mobile_no` varchar(140) DEFAULT NULL,
  `organization` varchar(140) DEFAULT NULL,
  `website` varchar(140) DEFAULT NULL,
  `organization_logo` text DEFAULT NULL,
  `company_description` text DEFAULT NULL,
  `linkedin` varchar(140) DEFAULT NULL,
  `twitter` varchar(140) DEFAULT NULL,
  `facebook` varchar(140) DEFAULT NULL,
  `territory` varchar(140) DEFAULT NULL,
  `industry` varchar(140) DEFAULT NULL,
  `job_title` varchar(140) DEFAULT NULL,
  `source` varchar(140) DEFAULT NULL,
  `lead_owner` varchar(140) DEFAULT NULL,
  `naming_series` varchar(140) DEFAULT 'CRM-LEAD-.YYYY.-',
  `middle_name` varchar(140) DEFAULT NULL,
  `gender` varchar(140) DEFAULT NULL,
  `phone` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT NULL,
  `no_of_employees` varchar(140) DEFAULT NULL,
  `annual_revenue` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `image` text DEFAULT NULL,
  `converted` int(1) NOT NULL DEFAULT 0,
  `lead_score` int(11) NOT NULL DEFAULT 0,
  `lead_temperature` varchar(140) DEFAULT NULL,
  `total` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `net_total` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `sla` varchar(140) DEFAULT NULL,
  `sla_creation` datetime(6) DEFAULT NULL,
  `sla_status` varchar(140) DEFAULT NULL,
  `communication_status` varchar(140) DEFAULT 'Open',
  `response_by` datetime(6) DEFAULT NULL,
  `first_response_time` decimal(21,9) DEFAULT NULL,
  `first_responded_on` datetime(6) DEFAULT NULL,
  `last_response_time` decimal(21,9) DEFAULT NULL,
  `last_responded_on` datetime(6) DEFAULT NULL,
  `facebook_lead_id` varchar(140) DEFAULT NULL,
  `facebook_form_id` varchar(140) DEFAULT NULL,
  `lost_reason` varchar(140) DEFAULT NULL,
  `lost_notes` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `_seen` text DEFAULT NULL,
  `custom_organization_type` varchar(140) DEFAULT NULL,
  `custom_contact_role` varchar(140) DEFAULT NULL,
  `custom_court_count` int(11) NOT NULL DEFAULT 0,
  `custom_lcs_court_count_band` varchar(140) DEFAULT NULL,
  `custom_area_m2` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `custom_lcs_area_band` varchar(140) DEFAULT NULL,
  `custom_in_service_region` varchar(140) DEFAULT NULL,
  `custom_project_type` varchar(140) DEFAULT NULL,
  `custom_setting` varchar(140) DEFAULT NULL,
  `custom_channel` varchar(140) DEFAULT NULL,
  `custom_search_query` varchar(140) DEFAULT NULL,
  `custom_site_visit_requested` int(1) NOT NULL DEFAULT 0,
  `custom_rfq_shared` int(1) NOT NULL DEFAULT 0,
  `custom_quote_requested` int(1) NOT NULL DEFAULT 0,
  `custom_lcs_visitor_id` varchar(140) DEFAULT NULL,
  `custom_lead_tier` varchar(140) DEFAULT NULL,
  `custom_fit_score` int(11) NOT NULL DEFAULT 0,
  `custom_intent_score` int(11) NOT NULL DEFAULT 0,
  `custom_is_mql` int(1) NOT NULL DEFAULT 0,
  `custom_playbook` varchar(140) DEFAULT NULL,
  `custom_classification_notes` text DEFAULT NULL,
  `custom_sla_hours` int(11) NOT NULL DEFAULT 0,
  `custom_sla_due_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `facebook_lead_id` (`facebook_lead_id`),
  KEY `lead_name` (`lead_name`),
  KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Lead` VALUES


-- ========================================================
-- Table `tabCRM Lead Source`
-- ========================================================
CREATE TABLE `tabCRM Lead Source` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `source_name` varchar(140) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `source_name` (`source_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Lead Source` VALUES


-- ========================================================
-- Table `tabCRM Lead Status`
-- ========================================================
CREATE TABLE `tabCRM Lead Status` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `lead_status` varchar(140) DEFAULT NULL,
  `type` varchar(140) DEFAULT 'Open',
  `color` varchar(140) DEFAULT 'gray',
  `position` int(11) NOT NULL DEFAULT 1,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `lead_status` (`lead_status`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Lead Status` VALUES


-- ========================================================
-- Table `tabCRM Lost Reason`
-- ========================================================
CREATE TABLE `tabCRM Lost Reason` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `lost_reason` varchar(140) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `lost_reason` (`lost_reason`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Lost Reason` VALUES


-- ========================================================
-- Table `tabCRM Notification`
-- ========================================================
CREATE TABLE `tabCRM Notification` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `notification_text` text DEFAULT NULL,
  `from_user` varchar(140) DEFAULT NULL,
  `type` varchar(140) DEFAULT NULL,
  `to_user` varchar(140) DEFAULT NULL,
  `read` int(1) NOT NULL DEFAULT 0,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `notification_type_doctype` varchar(140) DEFAULT NULL,
  `notification_type_doc` varchar(140) DEFAULT NULL,
  `comment` varchar(140) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Notification` VALUES


-- ========================================================
-- Table `tabCRM Organization`
-- ========================================================
CREATE TABLE `tabCRM Organization` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `organization_name` varchar(140) DEFAULT NULL,
  `no_of_employees` varchar(140) DEFAULT NULL,
  `currency` varchar(140) DEFAULT NULL,
  `exchange_rate` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `annual_revenue` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `organization_logo` text DEFAULT NULL,
  `website` varchar(140) DEFAULT NULL,
  `company_description` text DEFAULT NULL,
  `linkedin` varchar(140) DEFAULT NULL,
  `twitter` varchar(140) DEFAULT NULL,
  `facebook` varchar(140) DEFAULT NULL,
  `territory` varchar(140) DEFAULT NULL,
  `industry` varchar(140) DEFAULT NULL,
  `address` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `organization_name` (`organization_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Organization` VALUES


-- ========================================================
-- Table `tabCRM Product`
-- ========================================================
CREATE TABLE `tabCRM Product` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `naming_series` varchar(140) DEFAULT NULL,
  `product_code` varchar(140) DEFAULT NULL,
  `product_name` varchar(140) DEFAULT NULL,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `standard_rate` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `image` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `product_code` (`product_code`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Product Sync Issue`
-- ========================================================
CREATE TABLE `tabCRM Product Sync Issue` (
  `name` bigint(20) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `product` varchar(140) DEFAULT NULL,
  `kind` varchar(140) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `detected_on` datetime(6) DEFAULT NULL,
  `dismissed` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Products`
-- ========================================================
CREATE TABLE `tabCRM Products` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `product_code` varchar(140) DEFAULT NULL,
  `product_name` varchar(140) DEFAULT NULL,
  `qty` decimal(21,9) NOT NULL DEFAULT 1.000000000,
  `rate` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `discount_percentage` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `discount_amount` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `amount` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `net_amount` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Rolling Response Time`
-- ========================================================
CREATE TABLE `tabCRM Rolling Response Time` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `response_time` decimal(21,9) DEFAULT NULL,
  `responded_on` datetime(6) DEFAULT NULL,
  `status` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Sales Hierarchy`
-- ========================================================
CREATE TABLE `tabCRM Sales Hierarchy` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `full_name` varchar(140) DEFAULT NULL,
  `reports_to` varchar(140) DEFAULT NULL,
  `is_group` int(1) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `old_parent` varchar(140) DEFAULT NULL,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `user` (`user`),
  KEY `modified` (`modified`),
  KEY `lft_rgt_index` (`lft`,`rgt`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Service Day`
-- ========================================================
CREATE TABLE `tabCRM Service Day` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `workday` varchar(140) DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL,
  `end_time` time(6) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Service Level Agreement`
-- ========================================================
CREATE TABLE `tabCRM Service Level Agreement` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `apply_on` varchar(140) DEFAULT NULL,
  `sla_name` varchar(140) DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 0,
  `default` int(1) NOT NULL DEFAULT 0,
  `rolling_responses` int(1) NOT NULL DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `condition` longtext DEFAULT NULL,
  `condition_json` longtext DEFAULT NULL,
  `holiday_list` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `sla_name` (`sla_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Service Level Priority`
-- ========================================================
CREATE TABLE `tabCRM Service Level Priority` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `default_priority` int(1) NOT NULL DEFAULT 0,
  `priority` varchar(140) DEFAULT NULL,
  `first_response_time` decimal(21,9) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Status Change Log`
-- ========================================================
CREATE TABLE `tabCRM Status Change Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `from` varchar(140) DEFAULT NULL,
  `to` varchar(140) DEFAULT NULL,
  `from_date` datetime(6) DEFAULT NULL,
  `to_date` datetime(6) DEFAULT NULL,
  `duration` decimal(21,9) DEFAULT NULL,
  `last_status_change_log` varchar(140) DEFAULT NULL,
  `from_type` varchar(140) DEFAULT NULL,
  `to_type` varchar(140) DEFAULT NULL,
  `log_owner` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Status Change Log` VALUES


-- ========================================================
-- Table `tabCRM Task`
-- ========================================================
CREATE TABLE `tabCRM Task` (
  `name` bigint(20) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `priority` varchar(140) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_docname` varchar(140) DEFAULT NULL,
  `assigned_to` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `custom_reminder_sent` int(1) NOT NULL DEFAULT 0,
  `custom_warning_sent` int(1) NOT NULL DEFAULT 0,
  `custom_is_sla_task` int(1) NOT NULL DEFAULT 0,
  `custom_sla_hours` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM Task` VALUES


-- ========================================================
-- Table `tabCRM Telephony Agent`
-- ========================================================
CREATE TABLE `tabCRM Telephony Agent` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `user_name` varchar(140) DEFAULT NULL,
  `mobile_no` varchar(140) DEFAULT NULL,
  `default_medium` varchar(140) DEFAULT NULL,
  `twilio_number` varchar(140) DEFAULT NULL,
  `call_receiving_device` varchar(140) DEFAULT 'Computer',
  `exotel_number` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `user` (`user`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Telephony Phone`
-- ========================================================
CREATE TABLE `tabCRM Telephony Phone` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `number` varchar(140) DEFAULT NULL,
  `is_primary` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM Territory`
-- ========================================================
CREATE TABLE `tabCRM Territory` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `territory_name` varchar(140) DEFAULT NULL,
  `territory_manager` varchar(140) DEFAULT NULL,
  `old_parent` varchar(140) DEFAULT NULL,
  `parent_crm_territory` varchar(140) DEFAULT NULL,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `is_group` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `territory_name` (`territory_name`),
  KEY `modified` (`modified`),
  KEY `lft_rgt_index` (`lft`,`rgt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabCRM View Settings`
-- ========================================================
CREATE TABLE `tabCRM View Settings` (
  `name` bigint(20) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `label` varchar(140) DEFAULT NULL,
  `icon` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `is_default` int(1) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT 'list',
  `dt` varchar(140) DEFAULT NULL,
  `route_name` varchar(140) DEFAULT NULL,
  `pinned` int(1) NOT NULL DEFAULT 0,
  `public` int(1) NOT NULL DEFAULT 0,
  `filters` longtext DEFAULT NULL,
  `order_by` longtext DEFAULT NULL,
  `load_default_columns` int(1) NOT NULL DEFAULT 0,
  `columns` longtext DEFAULT NULL,
  `rows` longtext DEFAULT NULL,
  `group_by_field` varchar(140) DEFAULT NULL,
  `column_field` varchar(140) DEFAULT NULL,
  `title_field` varchar(140) DEFAULT NULL,
  `kanban_columns` longtext DEFAULT NULL,
  `kanban_fields` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCRM View Settings` VALUES


-- ========================================================
-- Table `tabCommunication`
-- ========================================================
CREATE TABLE `tabCommunication` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `subject` text DEFAULT NULL,
  `communication_medium` varchar(140) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `recipients` longtext DEFAULT NULL,
  `cc` longtext DEFAULT NULL,
  `bcc` longtext DEFAULT NULL,
  `phone_no` varchar(140) DEFAULT NULL,
  `delivery_status` varchar(140) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `text_content` longtext DEFAULT NULL,
  `communication_type` varchar(140) DEFAULT 'Communication',
  `comment_type` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT NULL,
  `sent_or_received` varchar(140) DEFAULT NULL,
  `communication_date` datetime(6) DEFAULT NULL,
  `read_receipt` int(1) NOT NULL DEFAULT 0,
  `send_after` datetime(6) DEFAULT NULL,
  `sender_full_name` varchar(140) DEFAULT NULL,
  `read_by_recipient` int(1) NOT NULL DEFAULT 0,
  `read_by_recipient_on` datetime(6) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `reference_owner` varchar(140) DEFAULT NULL,
  `email_account` varchar(140) DEFAULT NULL,
  `in_reply_to` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `email_template` varchar(140) DEFAULT NULL,
  `unread_notification_sent` int(1) NOT NULL DEFAULT 0,
  `seen` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `message_id` text DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT 0,
  `imap_folder` varchar(140) DEFAULT NULL,
  `email_status` varchar(140) DEFAULT NULL,
  `has_attachment` int(1) NOT NULL DEFAULT 0,
  `rating` int(11) NOT NULL DEFAULT 0,
  `feedback_request` varchar(140) DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `_seen` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `reference_owner` (`reference_owner`),
  KEY `modified` (`modified`),
  KEY `status_communication_type_index` (`status`,`communication_type`),
  KEY `message_id_index` (`message_id`(140)),
  KEY `comm_ref_type_date_idx` (`reference_doctype`,`reference_name`,`communication_date`,`communication_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED;


INSERT INTO `tabCommunication` VALUES


-- ========================================================
-- Table `tabCommunication Link`
-- ========================================================
CREATE TABLE `tabCommunication Link` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `link_doctype` varchar(140) DEFAULT NULL,
  `link_name` varchar(140) DEFAULT NULL,
  `link_title` varchar(140) DEFAULT NULL,
  `communication_date` datetime(6) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`),
  KEY `link_doctype_link_name_index` (`link_doctype`,`link_name`),
  KEY `link_doctype_link_name_communication_date_parent_index` (`link_doctype`,`link_name`,`communication_date`,`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabCommunication Link` VALUES


-- ========================================================
-- Table `tabContact`
-- ========================================================
CREATE TABLE `tabContact` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `first_name` varchar(140) DEFAULT NULL,
  `middle_name` varchar(140) DEFAULT NULL,
  `last_name` varchar(140) DEFAULT NULL,
  `full_name` varchar(140) DEFAULT NULL,
  `email_id` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `address` varchar(140) DEFAULT NULL,
  `sync_with_google_contacts` int(1) NOT NULL DEFAULT 0,
  `status` varchar(140) DEFAULT 'Passive',
  `salutation` varchar(140) DEFAULT NULL,
  `designation` varchar(140) DEFAULT NULL,
  `gender` varchar(140) DEFAULT NULL,
  `phone` varchar(140) DEFAULT NULL,
  `mobile_no` varchar(140) DEFAULT NULL,
  `company_name` varchar(140) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `google_contacts` varchar(140) DEFAULT NULL,
  `google_contacts_id` varchar(140) DEFAULT NULL,
  `pulled_from_google_contacts` int(1) NOT NULL DEFAULT 0,
  `is_primary_contact` int(1) NOT NULL DEFAULT 0,
  `department` varchar(140) DEFAULT NULL,
  `unsubscribed` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `email_id` (`email_id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabContact` VALUES


-- ========================================================
-- Table `tabContact Email`
-- ========================================================
CREATE TABLE `tabContact Email` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email_id` varchar(140) DEFAULT NULL,
  `is_primary` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabContact Email` VALUES


-- ========================================================
-- Table `tabContact Phone`
-- ========================================================
CREATE TABLE `tabContact Phone` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `phone` varchar(140) DEFAULT NULL,
  `is_primary_phone` int(1) NOT NULL DEFAULT 0,
  `is_primary_mobile_no` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabContact Phone` VALUES


-- ========================================================
-- Table `tabLead Sync Source`
-- ========================================================
CREATE TABLE `tabLead Sync Source` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT 'Facebook',
  `access_token` text DEFAULT NULL,
  `last_synced_at` datetime(6) DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `background_sync_frequency` varchar(140) DEFAULT 'Hourly',
  `facebook_page` varchar(140) DEFAULT NULL,
  `facebook_lead_form` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `facebook_lead_form` (`facebook_lead_form`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabNote`
-- ========================================================
CREATE TABLE `tabNote` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `public` int(1) NOT NULL DEFAULT 0,
  `notify_on_login` int(1) NOT NULL DEFAULT 0,
  `notify_on_every_login` int(1) NOT NULL DEFAULT 0,
  `expire_notification_on` date DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `expire_notification_on` (`expire_notification_on`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabNote Seen By`
-- ========================================================
CREATE TABLE `tabNote Seen By` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabUser`
-- ========================================================
CREATE TABLE `tabUser` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `email` varchar(140) DEFAULT NULL,
  `first_name` varchar(140) DEFAULT NULL,
  `middle_name` varchar(140) DEFAULT NULL,
  `last_name` varchar(140) DEFAULT NULL,
  `full_name` varchar(140) DEFAULT NULL,
  `username` varchar(140) DEFAULT NULL,
  `language` varchar(140) DEFAULT NULL,
  `time_zone` varchar(140) DEFAULT NULL,
  `send_welcome_email` int(1) NOT NULL DEFAULT 1,
  `unsubscribed` int(1) NOT NULL DEFAULT 0,
  `user_image` text DEFAULT NULL,
  `role_profile_name` varchar(140) DEFAULT NULL,
  `module_profile` varchar(140) DEFAULT NULL,
  `home_settings` longtext DEFAULT NULL,
  `gender` varchar(140) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `interest` text DEFAULT NULL,
  `phone` varchar(140) DEFAULT NULL,
  `location` varchar(140) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `mobile_no` varchar(140) DEFAULT NULL,
  `mute_sounds` int(1) NOT NULL DEFAULT 0,
  `desk_theme` varchar(140) DEFAULT NULL,
  `banner_image` text DEFAULT NULL,
  `search_bar` int(1) NOT NULL DEFAULT 1,
  `notifications` int(1) NOT NULL DEFAULT 1,
  `list_sidebar` int(1) NOT NULL DEFAULT 1,
  `bulk_actions` int(1) NOT NULL DEFAULT 1,
  `view_switcher` int(1) NOT NULL DEFAULT 1,
  `form_sidebar` int(1) NOT NULL DEFAULT 1,
  `form_navigation_buttons` int(1) NOT NULL DEFAULT 1,
  `timeline` int(1) NOT NULL DEFAULT 1,
  `dashboard` int(1) NOT NULL DEFAULT 1,
  `new_password` text DEFAULT NULL,
  `logout_all_sessions` int(1) NOT NULL DEFAULT 1,
  `reset_password_key` varchar(140) DEFAULT NULL,
  `last_reset_password_key_generated_on` datetime(6) DEFAULT NULL,
  `last_password_reset_date` date DEFAULT NULL,
  `redirect_url` text DEFAULT NULL,
  `document_follow_notify` int(1) NOT NULL DEFAULT 0,
  `document_follow_frequency` varchar(140) DEFAULT 'Daily',
  `follow_created_documents` int(1) NOT NULL DEFAULT 0,
  `follow_commented_documents` int(1) NOT NULL DEFAULT 0,
  `follow_liked_documents` int(1) NOT NULL DEFAULT 0,
  `follow_assigned_documents` int(1) NOT NULL DEFAULT 0,
  `follow_shared_documents` int(1) NOT NULL DEFAULT 0,
  `email_signature` text DEFAULT NULL,
  `thread_notify` int(1) NOT NULL DEFAULT 1,
  `send_me_a_copy` int(1) NOT NULL DEFAULT 0,
  `allowed_in_mentions` int(1) NOT NULL DEFAULT 1,
  `default_workspace` varchar(140) DEFAULT NULL,
  `default_app` varchar(140) DEFAULT NULL,
  `simultaneous_sessions` int(11) NOT NULL DEFAULT 2,
  `restrict_ip` text DEFAULT NULL,
  `last_ip` varchar(140) DEFAULT NULL,
  `login_after` int(11) NOT NULL DEFAULT 0,
  `user_type` varchar(140) DEFAULT 'System User',
  `last_active` datetime(6) DEFAULT NULL,
  `login_before` int(11) NOT NULL DEFAULT 0,
  `bypass_restrict_ip_check_if_2fa_enabled` int(1) NOT NULL DEFAULT 0,
  `last_login` varchar(140) DEFAULT NULL,
  `last_known_versions` text DEFAULT NULL,
  `api_key` varchar(140) DEFAULT NULL,
  `api_secret` text DEFAULT NULL,
  `onboarding_status` text DEFAULT '{}',
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile_no` (`mobile_no`),
  UNIQUE KEY `api_key` (`api_key`),
  KEY `last_active` (`last_active`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabUser` VALUES


-- ========================================================
-- Table `tabUser Document Type`
-- ========================================================
CREATE TABLE `tabUser Document Type` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `is_custom` int(1) NOT NULL DEFAULT 0,
  `read` int(1) NOT NULL DEFAULT 1,
  `write` int(1) NOT NULL DEFAULT 0,
  `create` int(1) NOT NULL DEFAULT 0,
  `submit` int(1) NOT NULL DEFAULT 0,
  `cancel` int(1) NOT NULL DEFAULT 0,
  `amend` int(1) NOT NULL DEFAULT 0,
  `delete` int(1) NOT NULL DEFAULT 0,
  `email` int(1) NOT NULL DEFAULT 1,
  `share` int(1) NOT NULL DEFAULT 1,
  `print` int(1) NOT NULL DEFAULT 1,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabUser Email`
-- ========================================================
CREATE TABLE `tabUser Email` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email_account` varchar(140) DEFAULT NULL,
  `email_id` varchar(140) DEFAULT NULL,
  `awaiting_password` int(1) NOT NULL DEFAULT 0,
  `used_oauth` int(1) NOT NULL DEFAULT 0,
  `enable_outgoing` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabUser Group`
-- ========================================================
CREATE TABLE `tabUser Group` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabUser Group Member`
-- ========================================================
CREATE TABLE `tabUser Group Member` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabUser Invitation`
-- ========================================================
CREATE TABLE `tabUser Invitation` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email` varchar(140) DEFAULT NULL,
  `app_name` varchar(140) DEFAULT NULL,
  `redirect_to_path` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT 'Pending',
  `invited_by` varchar(140) DEFAULT NULL,
  `key` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `email_sent_at` datetime(6) DEFAULT NULL,
  `accepted_at` datetime(6) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabUser Permission`
-- ========================================================
CREATE TABLE `tabUser Permission` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `allow` varchar(140) DEFAULT NULL,
  `for_value` varchar(140) DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT 0,
  `apply_to_all_doctypes` int(1) NOT NULL DEFAULT 1,
  `applicable_for` varchar(140) DEFAULT NULL,
  `hide_descendants` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `user` (`user`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabUser Role`
-- ========================================================
CREATE TABLE `tabUser Role` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `role` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabUser Select Document Type`
-- ========================================================
CREATE TABLE `tabUser Select Document Type` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- ========================================================
-- Table `tabUser Social Login`
-- ========================================================
CREATE TABLE `tabUser Social Login` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `provider` varchar(140) DEFAULT NULL,
  `username` varchar(140) DEFAULT NULL,
  `userid` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabUser Social Login` VALUES


-- ========================================================
-- Table `tabUser Type`
-- ========================================================
CREATE TABLE `tabUser Type` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `role` varchar(140) DEFAULT NULL,
  `apply_user_permission_on` varchar(140) DEFAULT NULL,
  `user_id_field` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


INSERT INTO `tabUser Type` VALUES


-- ========================================================
-- Table `tabUser Type Module`
-- ========================================================
CREATE TABLE `tabUser Type Module` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `module` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


