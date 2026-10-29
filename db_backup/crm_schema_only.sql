-- PC CRM Complete Schema Only (No Records)
-- Generated for Dashboard & Analytics Design

-- --------------------------------------------------------
-- Table structure for `__Auth`
-- --------------------------------------------------------
CREATE TABLE `__Auth` (
  `doctype` varchar(140) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fieldname` varchar(140) NOT NULL,
  `password` text NOT NULL,
  `encrypted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`doctype`,`name`,`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `__UserSettings`
-- --------------------------------------------------------
CREATE TABLE `__UserSettings` (
  `user` varchar(180) NOT NULL,
  `doctype` varchar(180) NOT NULL,
  `data` text DEFAULT NULL,
  UNIQUE KEY `user` (`user`,`doctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------
-- Table structure for `__global_search`
-- --------------------------------------------------------
CREATE TABLE `__global_search` (
  `doctype` varchar(100) DEFAULT NULL,
  `name` varchar(140) DEFAULT NULL,
  `title` varchar(140) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `route` varchar(140) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `doctype_name` (`doctype`,`name`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------
-- Table structure for `tabAbout Us Team Member`
-- --------------------------------------------------------
CREATE TABLE `tabAbout Us Team Member` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `full_name` varchar(140) DEFAULT NULL,
  `image_link` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabAccess Log`
-- --------------------------------------------------------
CREATE TABLE `tabAccess Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `export_from` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `reference_document` varchar(140) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `file_type` varchar(140) DEFAULT NULL,
  `method` varchar(140) DEFAULT NULL,
  `report_name` varchar(140) DEFAULT NULL,
  `filters` longtext DEFAULT NULL,
  `page` longtext DEFAULT NULL,
  `columns` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `_seen` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabActivity Log`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabAddress`
-- --------------------------------------------------------
CREATE TABLE `tabAddress` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `address_title` varchar(140) DEFAULT NULL,
  `address_type` varchar(140) DEFAULT NULL,
  `address_line1` varchar(240) DEFAULT NULL,
  `address_line2` varchar(240) DEFAULT NULL,
  `city` varchar(140) DEFAULT NULL,
  `county` varchar(140) DEFAULT NULL,
  `state` varchar(140) DEFAULT NULL,
  `country` varchar(140) DEFAULT NULL,
  `pincode` varchar(140) DEFAULT NULL,
  `email_id` varchar(140) DEFAULT NULL,
  `phone` varchar(140) DEFAULT NULL,
  `fax` varchar(140) DEFAULT NULL,
  `is_primary_address` int(1) NOT NULL DEFAULT 0,
  `is_shipping_address` int(1) NOT NULL DEFAULT 0,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `city` (`city`),
  KEY `country` (`country`),
  KEY `pincode` (`pincode`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabAddress Template`
-- --------------------------------------------------------
CREATE TABLE `tabAddress Template` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `country` varchar(140) DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT 0,
  `template` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `country` (`country`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabAmended Document Naming Settings`
-- --------------------------------------------------------
CREATE TABLE `tabAmended Document Naming Settings` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `action` varchar(140) DEFAULT 'Amend Counter',
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `document_type` (`document_type`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabAssignment Rule`
-- --------------------------------------------------------
CREATE TABLE `tabAssignment Rule` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `due_date_based_on` varchar(140) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT 'Automatic Assignment',
  `assign_condition` longtext DEFAULT NULL,
  `unassign_condition` longtext DEFAULT NULL,
  `close_condition` longtext DEFAULT NULL,
  `rule` varchar(140) DEFAULT NULL,
  `field` varchar(140) DEFAULT NULL,
  `last_user` varchar(140) DEFAULT NULL,
  `current_index` int(11) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `assign_condition_json` longtext DEFAULT NULL,
  `unassign_condition_json` longtext DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabAssignment Rule Day`
-- --------------------------------------------------------
CREATE TABLE `tabAssignment Rule Day` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `day` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabAssignment Rule User`
-- --------------------------------------------------------
CREATE TABLE `tabAssignment Rule User` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabAuto Email Report`
-- --------------------------------------------------------
CREATE TABLE `tabAuto Email Report` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `report` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT 'User',
  `enabled` int(1) NOT NULL DEFAULT 1,
  `report_type` varchar(140) DEFAULT NULL,
  `reference_report` varchar(140) DEFAULT NULL,
  `send_if_data` int(1) NOT NULL DEFAULT 1,
  `data_modified_till` int(11) NOT NULL DEFAULT 0,
  `no_of_rows` int(11) NOT NULL DEFAULT 100,
  `filters` text DEFAULT NULL,
  `filter_meta` text DEFAULT NULL,
  `from_date_field` varchar(140) DEFAULT NULL,
  `to_date_field` varchar(140) DEFAULT NULL,
  `dynamic_date_period` varchar(140) DEFAULT NULL,
  `use_first_day_of_period` int(1) NOT NULL DEFAULT 0,
  `email_to` text DEFAULT NULL,
  `day_of_week` varchar(140) DEFAULT 'Monday',
  `sender` varchar(140) DEFAULT NULL,
  `frequency` varchar(140) DEFAULT NULL,
  `format` varchar(140) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabAuto Repeat`
-- --------------------------------------------------------
CREATE TABLE `tabAuto Repeat` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_document` varchar(140) DEFAULT NULL,
  `submit_on_creation` int(1) NOT NULL DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `frequency` varchar(140) DEFAULT NULL,
  `repeat_on_day` int(11) NOT NULL DEFAULT 0,
  `repeat_on_last_day` int(1) NOT NULL DEFAULT 0,
  `next_schedule_date` date DEFAULT NULL,
  `notify_by_email` int(1) NOT NULL DEFAULT 0,
  `recipients` text DEFAULT NULL,
  `template` varchar(140) DEFAULT NULL,
  `subject` varchar(140) DEFAULT NULL,
  `message` text DEFAULT 'Please find attached {{ doc.doctype }} #{{ doc.name }}',
  `print_format` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `next_schedule_date` (`next_schedule_date`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabAuto Repeat Day`
-- --------------------------------------------------------
CREATE TABLE `tabAuto Repeat Day` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `day` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabBlock Module`
-- --------------------------------------------------------
CREATE TABLE `tabBlock Module` (
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


-- --------------------------------------------------------
-- Table structure for `tabBlog Category`
-- --------------------------------------------------------
CREATE TABLE `tabBlog Category` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `published` int(1) NOT NULL DEFAULT 1,
  `title` varchar(140) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `route` varchar(140) DEFAULT NULL,
  `preview_image` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `route` (`route`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabBlog Post`
-- --------------------------------------------------------
CREATE TABLE `tabBlog Post` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `blog_category` varchar(140) DEFAULT NULL,
  `blogger` varchar(140) DEFAULT NULL,
  `route` varchar(140) DEFAULT NULL,
  `read_time` int(11) NOT NULL DEFAULT 0,
  `published_on` date DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `featured` int(1) NOT NULL DEFAULT 0,
  `hide_cta` int(1) NOT NULL DEFAULT 0,
  `enable_email_notification` int(1) NOT NULL DEFAULT 1,
  `disable_comments` int(1) NOT NULL DEFAULT 0,
  `disable_likes` int(1) NOT NULL DEFAULT 0,
  `blog_intro` text DEFAULT NULL,
  `content_type` varchar(140) DEFAULT 'Markdown',
  `content` longtext DEFAULT NULL,
  `content_md` longtext DEFAULT NULL,
  `content_html` longtext DEFAULT NULL,
  `email_sent` int(1) NOT NULL DEFAULT 0,
  `meta_title` varchar(64) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `route` (`route`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabBlogger`
-- --------------------------------------------------------
CREATE TABLE `tabBlogger` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `short_name` varchar(140) DEFAULT NULL,
  `full_name` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabCRM Call Log`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Communication Status`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Contacts`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Dashboard`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Deal`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Deal Status`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Dropdown Item`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Enrichment Domain`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Enrichment Field Mapping`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Enrichment Link Priority`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Enrichment Rule`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Enrichment Rule Pattern`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Enrichment Run`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Enrichment Run Change`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Enrichment Skip Pattern`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Fields Layout`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Form Script`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Global Settings`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Holiday`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Holiday List`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Industry`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Invitation`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Lead`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Lead Source`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Lead Status`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Lost Reason`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Notification`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Organization`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Product`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Product Sync Issue`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Products`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Rolling Response Time`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Sales Hierarchy`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Service Day`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Service Level Agreement`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Service Level Priority`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Status Change Log`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Task`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Telephony Agent`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Telephony Phone`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM Territory`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCRM View Settings`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCalendar View`
-- --------------------------------------------------------
CREATE TABLE `tabCalendar View` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `subject_field` varchar(140) DEFAULT NULL,
  `start_date_field` varchar(140) DEFAULT NULL,
  `end_date_field` varchar(140) DEFAULT NULL,
  `all_day` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabChangelog Feed`
-- --------------------------------------------------------
CREATE TABLE `tabChangelog Feed` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `app_name` varchar(140) DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  `posting_timestamp` datetime(6) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `posting_timestamp` (`posting_timestamp`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabClient Script`
-- --------------------------------------------------------
CREATE TABLE `tabClient Script` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `dt` varchar(140) DEFAULT NULL,
  `view` varchar(140) DEFAULT 'Form',
  `module` varchar(140) DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 0,
  `script` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabColor`
-- --------------------------------------------------------
CREATE TABLE `tabColor` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `color` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabComment`
-- --------------------------------------------------------
CREATE TABLE `tabComment` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `comment_type` varchar(140) DEFAULT 'Comment',
  `comment_email` varchar(140) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `comment_by` varchar(140) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `seen` int(1) NOT NULL DEFAULT 0,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `reference_owner` varchar(140) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `ip_address` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `reference_doctype_reference_name_index` (`reference_doctype`,`reference_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabCommunication`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCommunication Link`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCompany History`
-- --------------------------------------------------------
CREATE TABLE `tabCompany History` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `year` varchar(140) DEFAULT NULL,
  `highlight` text DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabConnected App`
-- --------------------------------------------------------
CREATE TABLE `tabConnected App` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `provider_name` varchar(140) DEFAULT NULL,
  `openid_configuration` varchar(140) DEFAULT NULL,
  `client_id` varchar(140) DEFAULT NULL,
  `redirect_uri` varchar(140) DEFAULT NULL,
  `client_secret` text DEFAULT NULL,
  `authorization_uri` text DEFAULT NULL,
  `token_uri` varchar(140) DEFAULT NULL,
  `revocation_uri` varchar(140) DEFAULT NULL,
  `userinfo_uri` varchar(140) DEFAULT NULL,
  `introspection_uri` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabConsole Log`
-- --------------------------------------------------------
CREATE TABLE `tabConsole Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `script` longtext DEFAULT NULL,
  `type` varchar(140) DEFAULT NULL,
  `committed` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabContact`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabContact Email`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabContact Phone`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabCountry`
-- --------------------------------------------------------
CREATE TABLE `tabCountry` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `country_name` varchar(140) DEFAULT NULL,
  `date_format` varchar(140) DEFAULT NULL,
  `time_format` varchar(140) DEFAULT 'HH:mm:ss',
  `time_zones` text DEFAULT NULL,
  `code` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `country_name` (`country_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabCurrency`
-- --------------------------------------------------------
CREATE TABLE `tabCurrency` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `currency_name` varchar(140) DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 0,
  `fraction` varchar(140) DEFAULT NULL,
  `fraction_units` int(11) NOT NULL DEFAULT 0,
  `smallest_currency_fraction_value` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `symbol` varchar(140) DEFAULT NULL,
  `symbol_on_right` int(1) NOT NULL DEFAULT 0,
  `number_format` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `currency_name` (`currency_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabCustom DocPerm`
-- --------------------------------------------------------
CREATE TABLE `tabCustom DocPerm` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `role` varchar(140) DEFAULT NULL,
  `if_owner` int(1) NOT NULL DEFAULT 0,
  `permlevel` int(11) NOT NULL DEFAULT 0,
  `select` int(1) NOT NULL DEFAULT 0,
  `read` int(1) NOT NULL DEFAULT 1,
  `write` int(1) NOT NULL DEFAULT 0,
  `create` int(1) NOT NULL DEFAULT 0,
  `delete` int(1) NOT NULL DEFAULT 0,
  `submit` int(1) NOT NULL DEFAULT 0,
  `cancel` int(1) NOT NULL DEFAULT 0,
  `amend` int(1) NOT NULL DEFAULT 0,
  `report` int(1) NOT NULL DEFAULT 0,
  `export` int(1) NOT NULL DEFAULT 1,
  `import` int(1) NOT NULL DEFAULT 0,
  `share` int(1) NOT NULL DEFAULT 0,
  `print` int(1) NOT NULL DEFAULT 0,
  `email` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabCustom Field`
-- --------------------------------------------------------
CREATE TABLE `tabCustom Field` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `is_system_generated` int(1) NOT NULL DEFAULT 0,
  `dt` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `placeholder` varchar(140) DEFAULT NULL,
  `fieldname` varchar(140) DEFAULT NULL,
  `insert_after` varchar(140) DEFAULT NULL,
  `length` int(11) NOT NULL DEFAULT 0,
  `link_filters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`link_filters`)),
  `fieldtype` varchar(140) DEFAULT 'Data',
  `precision` varchar(140) DEFAULT NULL,
  `hide_seconds` int(1) NOT NULL DEFAULT 0,
  `hide_days` int(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `sort_options` int(1) NOT NULL DEFAULT 0,
  `fetch_from` text DEFAULT NULL,
  `fetch_if_empty` int(1) NOT NULL DEFAULT 0,
  `collapsible` int(1) NOT NULL DEFAULT 0,
  `collapsible_depends_on` longtext DEFAULT NULL,
  `default` text DEFAULT NULL,
  `depends_on` longtext DEFAULT NULL,
  `mandatory_depends_on` longtext DEFAULT NULL,
  `read_only_depends_on` longtext DEFAULT NULL,
  `non_negative` int(1) NOT NULL DEFAULT 0,
  `reqd` int(1) NOT NULL DEFAULT 0,
  `unique` int(1) NOT NULL DEFAULT 0,
  `is_virtual` int(1) NOT NULL DEFAULT 0,
  `read_only` int(1) NOT NULL DEFAULT 0,
  `ignore_user_permissions` int(1) NOT NULL DEFAULT 0,
  `hidden` int(1) NOT NULL DEFAULT 0,
  `print_hide` int(1) NOT NULL DEFAULT 0,
  `print_hide_if_no_value` int(1) NOT NULL DEFAULT 0,
  `print_width` varchar(140) DEFAULT NULL,
  `no_copy` int(1) NOT NULL DEFAULT 0,
  `allow_on_submit` int(1) NOT NULL DEFAULT 0,
  `in_list_view` int(1) NOT NULL DEFAULT 0,
  `in_standard_filter` int(1) NOT NULL DEFAULT 0,
  `in_global_search` int(1) NOT NULL DEFAULT 0,
  `in_preview` int(1) NOT NULL DEFAULT 0,
  `bold` int(1) NOT NULL DEFAULT 0,
  `report_hide` int(1) NOT NULL DEFAULT 0,
  `search_index` int(1) NOT NULL DEFAULT 0,
  `allow_in_quick_entry` int(1) NOT NULL DEFAULT 0,
  `ignore_xss_filter` int(1) NOT NULL DEFAULT 0,
  `translatable` int(1) NOT NULL DEFAULT 0,
  `hide_border` int(1) NOT NULL DEFAULT 0,
  `show_dashboard` int(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `permlevel` int(11) NOT NULL DEFAULT 0,
  `width` varchar(140) DEFAULT NULL,
  `columns` int(11) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `dt` (`dt`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabCustom HTML Block`
-- --------------------------------------------------------
CREATE TABLE `tabCustom HTML Block` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `private` int(1) NOT NULL DEFAULT 0,
  `html` longtext DEFAULT NULL,
  `script` longtext DEFAULT NULL,
  `style` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabCustom Role`
-- --------------------------------------------------------
CREATE TABLE `tabCustom Role` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `page` varchar(140) DEFAULT NULL,
  `report` varchar(140) DEFAULT NULL,
  `ref_doctype` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabCustomize Form Field`
-- --------------------------------------------------------
CREATE TABLE `tabCustomize Form Field` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `is_system_generated` int(1) NOT NULL DEFAULT 0,
  `label` varchar(140) DEFAULT NULL,
  `fieldtype` varchar(140) DEFAULT 'Data',
  `fieldname` varchar(140) DEFAULT NULL,
  `non_negative` int(1) NOT NULL DEFAULT 0,
  `reqd` int(1) NOT NULL DEFAULT 0,
  `unique` int(1) NOT NULL DEFAULT 0,
  `is_virtual` int(1) NOT NULL DEFAULT 0,
  `in_list_view` int(1) NOT NULL DEFAULT 0,
  `in_standard_filter` int(1) NOT NULL DEFAULT 0,
  `in_global_search` int(1) NOT NULL DEFAULT 0,
  `in_preview` int(1) NOT NULL DEFAULT 0,
  `bold` int(1) NOT NULL DEFAULT 0,
  `no_copy` int(1) NOT NULL DEFAULT 0,
  `allow_in_quick_entry` int(1) NOT NULL DEFAULT 0,
  `translatable` int(1) NOT NULL DEFAULT 1,
  `link_filters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`link_filters`)),
  `default` text DEFAULT NULL,
  `precision` varchar(140) DEFAULT NULL,
  `length` int(11) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `sort_options` int(1) NOT NULL DEFAULT 0,
  `fetch_from` text DEFAULT NULL,
  `fetch_if_empty` int(1) NOT NULL DEFAULT 0,
  `show_dashboard` int(1) NOT NULL DEFAULT 0,
  `depends_on` longtext DEFAULT NULL,
  `permlevel` int(11) NOT NULL DEFAULT 0,
  `hidden` int(1) NOT NULL DEFAULT 0,
  `read_only` int(1) NOT NULL DEFAULT 0,
  `collapsible` int(1) NOT NULL DEFAULT 0,
  `allow_bulk_edit` int(1) NOT NULL DEFAULT 0,
  `collapsible_depends_on` longtext DEFAULT NULL,
  `ignore_user_permissions` int(1) NOT NULL DEFAULT 0,
  `allow_on_submit` int(1) NOT NULL DEFAULT 0,
  `report_hide` int(1) NOT NULL DEFAULT 0,
  `remember_last_selected_value` int(1) NOT NULL DEFAULT 0,
  `hide_border` int(1) NOT NULL DEFAULT 0,
  `ignore_xss_filter` int(1) NOT NULL DEFAULT 0,
  `mandatory_depends_on` longtext DEFAULT NULL,
  `read_only_depends_on` longtext DEFAULT NULL,
  `in_filter` int(1) NOT NULL DEFAULT 0,
  `hide_seconds` int(1) NOT NULL DEFAULT 0,
  `hide_days` int(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `placeholder` varchar(140) DEFAULT NULL,
  `print_hide` int(1) NOT NULL DEFAULT 0,
  `print_hide_if_no_value` int(1) NOT NULL DEFAULT 0,
  `print_width` varchar(140) DEFAULT NULL,
  `columns` int(11) NOT NULL DEFAULT 0,
  `width` varchar(140) DEFAULT NULL,
  `is_custom_field` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `label` (`label`),
  KEY `fieldtype` (`fieldtype`),
  KEY `fieldname` (`fieldname`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDashboard`
-- --------------------------------------------------------
CREATE TABLE `tabDashboard` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `dashboard_name` varchar(140) DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT 0,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `module` varchar(140) DEFAULT NULL,
  `chart_options` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `dashboard_name` (`dashboard_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDashboard Chart`
-- --------------------------------------------------------
CREATE TABLE `tabDashboard Chart` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `module` varchar(140) DEFAULT NULL,
  `chart_name` varchar(140) DEFAULT NULL,
  `chart_type` varchar(140) DEFAULT NULL,
  `report_name` varchar(140) DEFAULT NULL,
  `use_report_chart` int(1) NOT NULL DEFAULT 0,
  `x_field` varchar(140) DEFAULT NULL,
  `source` varchar(140) DEFAULT NULL,
  `document_type` varchar(140) DEFAULT NULL,
  `parent_document_type` varchar(140) DEFAULT NULL,
  `based_on` varchar(140) DEFAULT NULL,
  `value_based_on` varchar(140) DEFAULT NULL,
  `group_by_type` varchar(140) DEFAULT 'Count',
  `group_by_based_on` varchar(140) DEFAULT NULL,
  `aggregate_function_based_on` varchar(140) DEFAULT NULL,
  `number_of_groups` int(11) NOT NULL DEFAULT 0,
  `is_public` int(1) NOT NULL DEFAULT 0,
  `heatmap_year` varchar(140) DEFAULT NULL,
  `timespan` varchar(140) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `time_interval` varchar(140) DEFAULT NULL,
  `timeseries` int(1) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT 'Line',
  `show_values_over_chart` int(1) NOT NULL DEFAULT 0,
  `currency` varchar(140) DEFAULT NULL,
  `filters_json` longtext DEFAULT NULL,
  `dynamic_filters_json` longtext DEFAULT NULL,
  `custom_options` longtext DEFAULT NULL,
  `color` varchar(140) DEFAULT NULL,
  `last_synced_on` datetime(6) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `chart_name` (`chart_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDashboard Chart Field`
-- --------------------------------------------------------
CREATE TABLE `tabDashboard Chart Field` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `y_field` varchar(140) DEFAULT NULL,
  `color` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDashboard Chart Link`
-- --------------------------------------------------------
CREATE TABLE `tabDashboard Chart Link` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `chart` varchar(140) DEFAULT NULL,
  `width` varchar(140) DEFAULT 'Half',
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDashboard Chart Source`
-- --------------------------------------------------------
CREATE TABLE `tabDashboard Chart Source` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `source_name` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `timeseries` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `source_name` (`source_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDashboard Settings`
-- --------------------------------------------------------
CREATE TABLE `tabDashboard Settings` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `chart_config` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabData Import`
-- --------------------------------------------------------
CREATE TABLE `tabData Import` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `import_type` varchar(140) DEFAULT NULL,
  `import_file` text DEFAULT NULL,
  `payload_count` int(11) NOT NULL DEFAULT 0,
  `google_sheets_url` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT 'Pending',
  `submit_after_import` int(1) NOT NULL DEFAULT 0,
  `mute_emails` int(1) NOT NULL DEFAULT 1,
  `template_options` longtext DEFAULT NULL,
  `template_warnings` longtext DEFAULT NULL,
  `show_failed_logs` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabData Import Log`
-- --------------------------------------------------------
CREATE TABLE `tabData Import Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `data_import` varchar(140) DEFAULT NULL,
  `row_indexes` longtext DEFAULT NULL,
  `success` int(1) NOT NULL DEFAULT 0,
  `docname` varchar(140) DEFAULT NULL,
  `messages` longtext DEFAULT NULL,
  `exception` text DEFAULT NULL,
  `log_index` int(11) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDefaultValue`
-- --------------------------------------------------------
CREATE TABLE `tabDefaultValue` (
  `name` varchar(255) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(255) DEFAULT NULL,
  `parentfield` varchar(255) DEFAULT NULL,
  `parenttype` varchar(255) DEFAULT NULL,
  `idx` int(8) NOT NULL DEFAULT 0,
  `defvalue` text DEFAULT NULL,
  `defkey` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`),
  KEY `defaultvalue_parent_defkey_index` (`parent`,`defkey`),
  KEY `defaultvalue_parent_parenttype_index` (`parent`,`parenttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDeleted Document`
-- --------------------------------------------------------
CREATE TABLE `tabDeleted Document` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `deleted_name` varchar(140) DEFAULT NULL,
  `deleted_doctype` varchar(140) DEFAULT NULL,
  `restored` int(1) NOT NULL DEFAULT 0,
  `new_name` varchar(140) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED;


-- --------------------------------------------------------
-- Table structure for `tabDesktop Icon`
-- --------------------------------------------------------
CREATE TABLE `tabDesktop Icon` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `module_name` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `standard` int(1) NOT NULL DEFAULT 0,
  `custom` int(1) NOT NULL DEFAULT 0,
  `app` varchar(140) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(140) DEFAULT NULL,
  `hidden` int(1) NOT NULL DEFAULT 0,
  `blocked` int(1) NOT NULL DEFAULT 0,
  `force_show` int(1) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT NULL,
  `_doctype` varchar(140) DEFAULT NULL,
  `_report` varchar(140) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `color` varchar(140) DEFAULT NULL,
  `icon` varchar(140) DEFAULT NULL,
  `reverse` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `unique_module_name_owner_standard` (`module_name`,`owner`,`standard`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDiscussion Reply`
-- --------------------------------------------------------
CREATE TABLE `tabDiscussion Reply` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `topic` varchar(140) DEFAULT NULL,
  `reply` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDiscussion Topic`
-- --------------------------------------------------------
CREATE TABLE `tabDiscussion Topic` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_docname` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocField`
-- --------------------------------------------------------
CREATE TABLE `tabDocField` (
  `name` varchar(255) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(255) DEFAULT NULL,
  `parentfield` varchar(255) DEFAULT NULL,
  `parenttype` varchar(255) DEFAULT NULL,
  `idx` int(8) NOT NULL DEFAULT 0,
  `fieldname` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `oldfieldname` varchar(140) DEFAULT NULL,
  `fieldtype` varchar(140) DEFAULT 'Data',
  `oldfieldtype` varchar(140) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `search_index` int(1) NOT NULL DEFAULT 0,
  `show_dashboard` int(1) NOT NULL DEFAULT 0,
  `hidden` int(1) NOT NULL DEFAULT 0,
  `set_only_once` int(1) NOT NULL DEFAULT 0,
  `allow_in_quick_entry` int(1) NOT NULL DEFAULT 0,
  `print_hide` int(1) NOT NULL DEFAULT 0,
  `report_hide` int(1) NOT NULL DEFAULT 0,
  `reqd` int(1) NOT NULL DEFAULT 0,
  `bold` int(1) NOT NULL DEFAULT 0,
  `in_global_search` int(1) NOT NULL DEFAULT 0,
  `collapsible` int(1) NOT NULL DEFAULT 0,
  `unique` int(1) NOT NULL DEFAULT 0,
  `no_copy` int(1) NOT NULL DEFAULT 0,
  `allow_on_submit` int(1) NOT NULL DEFAULT 0,
  `show_preview_popup` int(1) NOT NULL DEFAULT 0,
  `trigger` varchar(255) DEFAULT NULL,
  `collapsible_depends_on` longtext DEFAULT NULL,
  `mandatory_depends_on` longtext DEFAULT NULL,
  `read_only_depends_on` longtext DEFAULT NULL,
  `depends_on` longtext DEFAULT NULL,
  `permlevel` int(11) NOT NULL DEFAULT 0,
  `ignore_user_permissions` int(1) NOT NULL DEFAULT 0,
  `width` varchar(64) DEFAULT NULL,
  `print_width` varchar(64) DEFAULT NULL,
  `columns` int(11) NOT NULL DEFAULT 0,
  `default` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `in_list_view` int(1) NOT NULL DEFAULT 0,
  `fetch_if_empty` int(1) NOT NULL DEFAULT 0,
  `in_filter` int(1) NOT NULL DEFAULT 0,
  `remember_last_selected_value` int(1) NOT NULL DEFAULT 0,
  `ignore_xss_filter` int(1) NOT NULL DEFAULT 0,
  `print_hide_if_no_value` int(1) NOT NULL DEFAULT 0,
  `allow_bulk_edit` int(1) NOT NULL DEFAULT 0,
  `in_standard_filter` int(1) NOT NULL DEFAULT 0,
  `in_preview` int(1) NOT NULL DEFAULT 0,
  `read_only` int(1) NOT NULL DEFAULT 0,
  `precision` varchar(140) DEFAULT NULL,
  `max_height` varchar(64) DEFAULT NULL,
  `length` int(11) NOT NULL DEFAULT 0,
  `translatable` int(1) NOT NULL DEFAULT 0,
  `hide_border` int(1) NOT NULL DEFAULT 0,
  `hide_days` int(1) NOT NULL DEFAULT 0,
  `hide_seconds` int(1) NOT NULL DEFAULT 0,
  `non_negative` int(1) NOT NULL DEFAULT 0,
  `is_virtual` int(1) NOT NULL DEFAULT 0,
  `sort_options` int(1) NOT NULL DEFAULT 0,
  `link_filters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`link_filters`)),
  `fetch_from` text DEFAULT NULL,
  `show_on_timeline` int(1) NOT NULL DEFAULT 0,
  `make_attachment_public` int(1) NOT NULL DEFAULT 0,
  `documentation_url` varchar(140) DEFAULT NULL,
  `placeholder` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`),
  KEY `label` (`label`),
  KEY `fieldtype` (`fieldtype`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocPerm`
-- --------------------------------------------------------
CREATE TABLE `tabDocPerm` (
  `name` varchar(255) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(255) DEFAULT NULL,
  `parentfield` varchar(255) DEFAULT NULL,
  `parenttype` varchar(255) DEFAULT NULL,
  `idx` int(8) NOT NULL DEFAULT 0,
  `permlevel` int(11) DEFAULT 0,
  `role` varchar(140) DEFAULT NULL,
  `match` varchar(255) DEFAULT NULL,
  `read` int(1) NOT NULL DEFAULT 1,
  `write` int(1) NOT NULL DEFAULT 1,
  `create` int(1) NOT NULL DEFAULT 1,
  `submit` int(1) NOT NULL DEFAULT 0,
  `cancel` int(1) NOT NULL DEFAULT 0,
  `delete` int(1) NOT NULL DEFAULT 1,
  `amend` int(1) NOT NULL DEFAULT 0,
  `report` int(1) NOT NULL DEFAULT 1,
  `export` int(1) NOT NULL DEFAULT 1,
  `import` int(1) NOT NULL DEFAULT 0,
  `share` int(1) NOT NULL DEFAULT 1,
  `print` int(1) NOT NULL DEFAULT 1,
  `email` int(1) NOT NULL DEFAULT 1,
  `if_owner` int(1) NOT NULL DEFAULT 0,
  `select` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocShare`
-- --------------------------------------------------------
CREATE TABLE `tabDocShare` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `share_doctype` varchar(140) DEFAULT NULL,
  `share_name` varchar(140) DEFAULT NULL,
  `read` int(1) NOT NULL DEFAULT 0,
  `write` int(1) NOT NULL DEFAULT 0,
  `share` int(1) NOT NULL DEFAULT 0,
  `submit` int(1) NOT NULL DEFAULT 0,
  `everyone` int(1) NOT NULL DEFAULT 0,
  `notify_by_email` int(1) NOT NULL DEFAULT 1,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `user` (`user`),
  KEY `share_doctype` (`share_doctype`),
  KEY `share_name` (`share_name`),
  KEY `everyone` (`everyone`),
  KEY `modified` (`modified`),
  KEY `user_share_doctype_index` (`user`,`share_doctype`),
  KEY `share_doctype_share_name_index` (`share_doctype`,`share_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocType`
-- --------------------------------------------------------
CREATE TABLE `tabDocType` (
  `name` varchar(255) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `search_fields` varchar(140) DEFAULT NULL,
  `issingle` int(1) NOT NULL DEFAULT 0,
  `is_virtual` int(1) NOT NULL DEFAULT 0,
  `is_tree` int(1) NOT NULL DEFAULT 0,
  `istable` int(1) NOT NULL DEFAULT 0,
  `editable_grid` int(1) NOT NULL DEFAULT 1,
  `track_changes` int(1) NOT NULL DEFAULT 0,
  `module` varchar(140) DEFAULT NULL,
  `restrict_to_domain` varchar(140) DEFAULT NULL,
  `app` varchar(255) DEFAULT NULL,
  `autoname` varchar(140) DEFAULT NULL,
  `naming_rule` varchar(64) DEFAULT NULL,
  `title_field` varchar(140) DEFAULT NULL,
  `image_field` varchar(140) DEFAULT NULL,
  `timeline_field` varchar(140) DEFAULT NULL,
  `sort_field` varchar(140) DEFAULT 'modified',
  `sort_order` varchar(140) DEFAULT 'DESC',
  `description` text DEFAULT NULL,
  `colour` varchar(255) DEFAULT NULL,
  `read_only` int(1) NOT NULL DEFAULT 0,
  `in_create` int(1) NOT NULL DEFAULT 0,
  `menu_index` int(11) DEFAULT NULL,
  `parent_node` varchar(255) DEFAULT NULL,
  `smallicon` varchar(255) DEFAULT NULL,
  `allow_copy` int(1) NOT NULL DEFAULT 0,
  `allow_rename` int(1) NOT NULL DEFAULT 1,
  `allow_import` int(1) NOT NULL DEFAULT 0,
  `hide_toolbar` int(1) NOT NULL DEFAULT 0,
  `track_seen` int(1) NOT NULL DEFAULT 0,
  `max_attachments` int(11) NOT NULL DEFAULT 0,
  `print_outline` varchar(255) DEFAULT NULL,
  `document_type` varchar(140) DEFAULT NULL,
  `icon` varchar(140) DEFAULT NULL,
  `color` varchar(140) DEFAULT NULL,
  `tag_fields` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `_last_update` varchar(32) DEFAULT NULL,
  `engine` varchar(140) DEFAULT 'InnoDB',
  `default_print_format` varchar(140) DEFAULT NULL,
  `is_submittable` int(1) NOT NULL DEFAULT 0,
  `show_name_in_global_search` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `custom` int(1) NOT NULL DEFAULT 0,
  `beta` int(1) NOT NULL DEFAULT 0,
  `has_web_view` int(1) NOT NULL DEFAULT 0,
  `allow_guest_to_view` int(1) NOT NULL DEFAULT 0,
  `route` varchar(140) DEFAULT NULL,
  `is_published_field` varchar(140) DEFAULT NULL,
  `website_search_field` varchar(140) DEFAULT NULL,
  `email_append_to` int(1) NOT NULL DEFAULT 0,
  `subject_field` varchar(140) DEFAULT NULL,
  `sender_field` varchar(140) DEFAULT NULL,
  `show_title_field_in_link` int(1) NOT NULL DEFAULT 0,
  `migration_hash` varchar(140) DEFAULT NULL,
  `translated_doctype` int(1) NOT NULL DEFAULT 0,
  `is_calendar_and_gantt` int(1) NOT NULL DEFAULT 0,
  `quick_entry` int(1) NOT NULL DEFAULT 0,
  `grid_page_length` int(11) NOT NULL DEFAULT 50,
  `rows_threshold_for_grid_search` int(11) NOT NULL DEFAULT 20,
  `track_views` int(1) NOT NULL DEFAULT 0,
  `queue_in_background` int(1) NOT NULL DEFAULT 0,
  `documentation` varchar(140) DEFAULT NULL,
  `nsm_parent_field` varchar(140) DEFAULT NULL,
  `allow_events_in_timeline` int(1) NOT NULL DEFAULT 0,
  `allow_auto_repeat` int(1) NOT NULL DEFAULT 0,
  `make_attachments_public` int(1) NOT NULL DEFAULT 0,
  `default_view` varchar(140) DEFAULT NULL,
  `force_re_route_to_default_view` int(1) NOT NULL DEFAULT 0,
  `show_preview_popup` int(1) NOT NULL DEFAULT 0,
  `default_email_template` varchar(140) DEFAULT NULL,
  `sender_name_field` varchar(140) DEFAULT NULL,
  `recipient_account_field` varchar(140) DEFAULT NULL,
  `protect_attached_files` int(1) NOT NULL DEFAULT 0,
  `index_web_pages_for_search` int(1) NOT NULL DEFAULT 1,
  `row_format` varchar(140) DEFAULT 'Dynamic',
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocType Action`
-- --------------------------------------------------------
CREATE TABLE `tabDocType Action` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  `idx` int(8) NOT NULL DEFAULT 0,
  `label` varchar(140) DEFAULT NULL,
  `group` varchar(140) DEFAULT NULL,
  `action_type` varchar(140) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `hidden` int(1) NOT NULL DEFAULT 0,
  `custom` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocType Layout`
-- --------------------------------------------------------
CREATE TABLE `tabDocType Layout` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `route` varchar(140) DEFAULT NULL,
  `client_script` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocType Layout Field`
-- --------------------------------------------------------
CREATE TABLE `tabDocType Layout Field` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `label` varchar(140) DEFAULT NULL,
  `fieldname` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocType Link`
-- --------------------------------------------------------
CREATE TABLE `tabDocType Link` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  `idx` int(8) NOT NULL DEFAULT 0,
  `group` varchar(140) DEFAULT NULL,
  `link_doctype` varchar(140) DEFAULT NULL,
  `link_fieldname` varchar(140) DEFAULT NULL,
  `parent_doctype` varchar(140) DEFAULT NULL,
  `table_fieldname` varchar(140) DEFAULT NULL,
  `hidden` int(1) NOT NULL DEFAULT 0,
  `is_child_table` int(1) NOT NULL DEFAULT 0,
  `custom` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocType State`
-- --------------------------------------------------------
CREATE TABLE `tabDocType State` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `color` varchar(140) DEFAULT 'Blue',
  `custom` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDoctype To Sync`
-- --------------------------------------------------------
CREATE TABLE `tabDoctype To Sync` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `doc_type` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocument Follow`
-- --------------------------------------------------------
CREATE TABLE `tabDocument Follow` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `ref_doctype` varchar(140) DEFAULT NULL,
  `ref_docname` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `ref_doctype` (`ref_doctype`),
  KEY `ref_docname` (`ref_docname`),
  KEY `user` (`user`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocument Naming Rule`
-- --------------------------------------------------------
CREATE TABLE `tabDocument Naming Rule` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `prefix` varchar(140) DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT 0,
  `prefix_digits` int(11) NOT NULL DEFAULT 5,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocument Naming Rule Condition`
-- --------------------------------------------------------
CREATE TABLE `tabDocument Naming Rule Condition` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `field` varchar(140) DEFAULT NULL,
  `condition` varchar(140) DEFAULT NULL,
  `value` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDocument Share Key`
-- --------------------------------------------------------
CREATE TABLE `tabDocument Share Key` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_docname` varchar(140) DEFAULT NULL,
  `key` varchar(140) DEFAULT NULL,
  `expires_on` date DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `reference_doctype` (`reference_doctype`),
  KEY `reference_docname` (`reference_docname`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDomain`
-- --------------------------------------------------------
CREATE TABLE `tabDomain` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `domain` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `domain` (`domain`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDuckDB Sync`
-- --------------------------------------------------------
CREATE TABLE `tabDuckDB Sync` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `doc_type` varchar(140) DEFAULT NULL,
  `filename` varchar(140) DEFAULT NULL,
  `amended_from` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `amended_from` (`amended_from`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDuckDB Sync Item`
-- --------------------------------------------------------
CREATE TABLE `tabDuckDB Sync Item` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `table` varchar(140) DEFAULT NULL,
  `synced` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabDynamic Link`
-- --------------------------------------------------------
CREATE TABLE `tabDynamic Link` (
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
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`),
  KEY `link_doctype_link_name_index` (`link_doctype`,`link_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEmail Account`
-- --------------------------------------------------------
CREATE TABLE `tabEmail Account` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email_id` varchar(140) DEFAULT NULL,
  `email_account_name` varchar(140) DEFAULT NULL,
  `domain` varchar(140) DEFAULT NULL,
  `service` varchar(140) DEFAULT NULL,
  `auth_method` varchar(140) DEFAULT 'Basic',
  `backend_app_flow` int(1) NOT NULL DEFAULT 0,
  `password` text DEFAULT NULL,
  `awaiting_password` int(1) NOT NULL DEFAULT 0,
  `ascii_encode_password` int(1) NOT NULL DEFAULT 0,
  `connected_app` varchar(140) DEFAULT NULL,
  `connected_user` varchar(140) DEFAULT NULL,
  `login_id_is_different` int(1) NOT NULL DEFAULT 0,
  `login_id` varchar(140) DEFAULT NULL,
  `enable_incoming` int(1) NOT NULL DEFAULT 0,
  `default_incoming` int(1) NOT NULL DEFAULT 0,
  `use_imap` int(1) NOT NULL DEFAULT 0,
  `use_ssl` int(1) NOT NULL DEFAULT 0,
  `use_starttls` int(1) NOT NULL DEFAULT 0,
  `email_server` varchar(140) DEFAULT NULL,
  `incoming_port` varchar(140) DEFAULT NULL,
  `attachment_limit` int(11) NOT NULL DEFAULT 0,
  `email_sync_option` varchar(140) DEFAULT 'UNSEEN',
  `initial_sync_count` varchar(140) DEFAULT '250',
  `append_emails_to_sent_folder` int(1) NOT NULL DEFAULT 0,
  `sent_folder_name` varchar(140) DEFAULT NULL,
  `append_to` varchar(140) DEFAULT NULL,
  `create_contact` int(1) NOT NULL DEFAULT 1,
  `enable_automatic_linking` int(1) NOT NULL DEFAULT 0,
  `notify_if_unreplied` int(1) NOT NULL DEFAULT 0,
  `unreplied_for_mins` int(11) NOT NULL DEFAULT 30,
  `send_notification_to` text DEFAULT NULL,
  `enable_outgoing` int(1) NOT NULL DEFAULT 0,
  `use_tls` int(1) NOT NULL DEFAULT 0,
  `use_ssl_for_outgoing` int(1) NOT NULL DEFAULT 0,
  `smtp_server` varchar(140) DEFAULT NULL,
  `smtp_port` varchar(140) DEFAULT NULL,
  `default_outgoing` int(1) NOT NULL DEFAULT 0,
  `always_use_account_email_id_as_sender` int(1) NOT NULL DEFAULT 0,
  `always_use_account_name_as_sender_name` int(1) NOT NULL DEFAULT 0,
  `send_unsubscribe_message` int(1) NOT NULL DEFAULT 1,
  `track_email_status` int(1) NOT NULL DEFAULT 1,
  `no_smtp_authentication` int(1) NOT NULL DEFAULT 0,
  `always_bcc` varchar(140) DEFAULT NULL,
  `add_signature` int(1) NOT NULL DEFAULT 0,
  `signature` longtext DEFAULT NULL,
  `enable_auto_reply` int(1) NOT NULL DEFAULT 0,
  `auto_reply_message` longtext DEFAULT NULL,
  `footer` longtext DEFAULT NULL,
  `brand_logo` text DEFAULT NULL,
  `uidvalidity` varchar(140) DEFAULT NULL,
  `uidnext` int(11) NOT NULL DEFAULT 0,
  `no_failed` int(11) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `create_lead_from_incoming_email` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`),
  UNIQUE KEY `email_id` (`email_id`),
  UNIQUE KEY `email_account_name` (`email_account_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEmail Domain`
-- --------------------------------------------------------
CREATE TABLE `tabEmail Domain` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `domain_name` varchar(140) DEFAULT NULL,
  `email_server` varchar(140) DEFAULT NULL,
  `use_imap` int(1) NOT NULL DEFAULT 0,
  `use_ssl` int(1) NOT NULL DEFAULT 0,
  `use_starttls` int(1) NOT NULL DEFAULT 0,
  `incoming_port` varchar(140) DEFAULT NULL,
  `attachment_limit` int(11) NOT NULL DEFAULT 0,
  `smtp_server` varchar(140) DEFAULT NULL,
  `use_tls` int(1) NOT NULL DEFAULT 0,
  `use_ssl_for_outgoing` int(1) NOT NULL DEFAULT 0,
  `smtp_port` varchar(140) DEFAULT NULL,
  `append_emails_to_sent_folder` int(1) NOT NULL DEFAULT 0,
  `sent_folder_name` varchar(140) DEFAULT 'Sent',
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `domain_name` (`domain_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEmail Flag Queue`
-- --------------------------------------------------------
CREATE TABLE `tabEmail Flag Queue` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `is_completed` int(1) NOT NULL DEFAULT 0,
  `communication` varchar(140) DEFAULT NULL,
  `action` varchar(140) DEFAULT NULL,
  `email_account` varchar(140) DEFAULT NULL,
  `uid` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEmail Group`
-- --------------------------------------------------------
CREATE TABLE `tabEmail Group` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `total_subscribers` int(11) NOT NULL DEFAULT 0,
  `confirmation_email_template` varchar(140) DEFAULT NULL,
  `welcome_email_template` varchar(140) DEFAULT NULL,
  `welcome_url` varchar(140) DEFAULT NULL,
  `add_query_parameters` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `title` (`title`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEmail Group Member`
-- --------------------------------------------------------
CREATE TABLE `tabEmail Group Member` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email_group` varchar(140) DEFAULT NULL,
  `email` varchar(140) DEFAULT NULL,
  `unsubscribed` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `unique_email_group_email` (`email_group`,`email`),
  KEY `email_group` (`email_group`),
  KEY `unsubscribed` (`unsubscribed`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEmail Queue`
-- --------------------------------------------------------
CREATE TABLE `tabEmail Queue` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sender` varchar(140) DEFAULT NULL,
  `show_as_cc` text DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `status` varchar(140) DEFAULT 'Not Sent',
  `error` longtext DEFAULT NULL,
  `message_id` text DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `communication` varchar(140) DEFAULT NULL,
  `send_after` datetime(6) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 1,
  `add_unsubscribe_link` int(1) NOT NULL DEFAULT 1,
  `unsubscribe_param` varchar(140) DEFAULT NULL,
  `unsubscribe_method` varchar(140) DEFAULT NULL,
  `expose_recipients` varchar(140) DEFAULT NULL,
  `attachments` longtext DEFAULT NULL,
  `retry` int(11) NOT NULL DEFAULT 0,
  `email_account` varchar(140) DEFAULT NULL,
  `redact_message_after_send` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `reference_name` (`reference_name`),
  KEY `communication` (`communication`),
  KEY `modified` (`modified`),
  KEY `index_bulk_flush` (`status`,`send_after`,`priority`,`creation`),
  KEY `message_id_index` (`message_id`(140))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED;


-- --------------------------------------------------------
-- Table structure for `tabEmail Queue Recipient`
-- --------------------------------------------------------
CREATE TABLE `tabEmail Queue Recipient` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `recipient` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT 'Not Sent',
  `error` longtext DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `status` (`status`),
  KEY `parent` (`parent`),
  KEY `modified_index` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEmail Rule`
-- --------------------------------------------------------
CREATE TABLE `tabEmail Rule` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email_id` varchar(140) DEFAULT NULL,
  `is_spam` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `email_id` (`email_id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEmail Template`
-- --------------------------------------------------------
CREATE TABLE `tabEmail Template` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `subject` varchar(140) DEFAULT NULL,
  `use_html` int(1) NOT NULL DEFAULT 0,
  `response_html` longtext DEFAULT NULL,
  `response` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 0,
  `reference_doctype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEmail Unsubscribe`
-- --------------------------------------------------------
CREATE TABLE `tabEmail Unsubscribe` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `global_unsubscribe` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `email` (`email`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEnergy Point Log`
-- --------------------------------------------------------
CREATE TABLE `tabEnergy Point Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `type` varchar(140) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `rule` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `reverted` int(1) NOT NULL DEFAULT 0,
  `revert_of` varchar(140) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `seen` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `user` (`user`),
  KEY `reference_name` (`reference_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEnergy Point Rule`
-- --------------------------------------------------------
CREATE TABLE `tabEnergy Point Rule` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `rule_name` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `for_doc_event` varchar(140) DEFAULT 'Custom',
  `field_to_check` varchar(140) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `for_assigned_users` int(1) NOT NULL DEFAULT 0,
  `user_field` varchar(140) DEFAULT NULL,
  `multiplier_field` varchar(140) DEFAULT NULL,
  `max_points` int(11) NOT NULL DEFAULT 0,
  `apply_only_once` int(1) NOT NULL DEFAULT 0,
  `condition` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `rule_name` (`rule_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabError Log`
-- --------------------------------------------------------
CREATE TABLE `tabError Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `seen` int(1) NOT NULL DEFAULT 0,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `method` varchar(140) DEFAULT NULL,
  `error` longtext DEFAULT NULL,
  `trace_id` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `reference_doctype` (`reference_doctype`),
  KEY `modified` (`modified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEvent`
-- --------------------------------------------------------
CREATE TABLE `tabEvent` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `subject` text DEFAULT NULL,
  `event_category` varchar(140) DEFAULT NULL,
  `event_type` varchar(140) DEFAULT NULL,
  `color` varchar(140) DEFAULT NULL,
  `repeat_this_event` int(1) NOT NULL DEFAULT 0,
  `location` varchar(140) DEFAULT NULL,
  `starts_on` datetime(6) DEFAULT NULL,
  `ends_on` datetime(6) DEFAULT NULL,
  `status` varchar(140) DEFAULT 'Open',
  `sender` varchar(140) DEFAULT NULL,
  `attending` varchar(140) DEFAULT NULL,
  `all_day` int(1) NOT NULL DEFAULT 0,
  `sync_with_google_calendar` int(1) NOT NULL DEFAULT 0,
  `add_video_conferencing` int(1) NOT NULL DEFAULT 0,
  `google_calendar` varchar(140) DEFAULT NULL,
  `google_calendar_id` varchar(140) DEFAULT NULL,
  `google_calendar_event_id` varchar(320) DEFAULT NULL,
  `google_meet_link` text DEFAULT NULL,
  `pulled_from_google_calendar` int(1) NOT NULL DEFAULT 0,
  `repeat_on` varchar(140) DEFAULT NULL,
  `repeat_till` date DEFAULT NULL,
  `monday` int(1) NOT NULL DEFAULT 0,
  `tuesday` int(1) NOT NULL DEFAULT 0,
  `wednesday` int(1) NOT NULL DEFAULT 0,
  `thursday` int(1) NOT NULL DEFAULT 0,
  `friday` int(1) NOT NULL DEFAULT 0,
  `saturday` int(1) NOT NULL DEFAULT 0,
  `sunday` int(1) NOT NULL DEFAULT 0,
  `description` longtext DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_docname` varchar(140) DEFAULT NULL,
  `send_reminder` int(1) NOT NULL DEFAULT 1,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `_seen` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `event_type` (`event_type`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEvent Notifications`
-- --------------------------------------------------------
CREATE TABLE `tabEvent Notifications` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT 'Notification',
  `before` int(11) NOT NULL DEFAULT 0,
  `interval` varchar(140) DEFAULT NULL,
  `time` time(6) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabEvent Participants`
-- --------------------------------------------------------
CREATE TABLE `tabEvent Participants` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_docname` varchar(140) DEFAULT NULL,
  `email` varchar(140) DEFAULT NULL,
  `attending` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabFCRM Note`
-- --------------------------------------------------------
CREATE TABLE `tabFCRM Note` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT 'CRM Lead',
  `reference_docname` varchar(140) DEFAULT NULL,
  `pinned` int(1) NOT NULL DEFAULT 0,
  `pinned_by` varchar(140) DEFAULT NULL,
  `pinned_on` datetime(6) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabFacebook Lead Form`
-- --------------------------------------------------------
CREATE TABLE `tabFacebook Lead Form` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `page` varchar(140) DEFAULT NULL,
  `id` varchar(140) DEFAULT NULL,
  `form_name` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabFacebook Lead Form Question`
-- --------------------------------------------------------
CREATE TABLE `tabFacebook Lead Form Question` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `label` varchar(140) DEFAULT NULL,
  `id` varchar(140) DEFAULT NULL,
  `key` varchar(140) DEFAULT NULL,
  `type` varchar(140) DEFAULT NULL,
  `mapped_to_crm_field` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabFacebook Page`
-- --------------------------------------------------------
CREATE TABLE `tabFacebook Page` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `page_name` varchar(140) DEFAULT NULL,
  `account_id` varchar(140) DEFAULT NULL,
  `category` varchar(140) DEFAULT NULL,
  `id` varchar(140) DEFAULT NULL,
  `access_token` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabFailed Lead Sync Log`
-- --------------------------------------------------------
CREATE TABLE `tabFailed Lead Sync Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT 'Failure',
  `source` varchar(140) DEFAULT NULL,
  `lead_data` longtext DEFAULT NULL,
  `traceback` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabFile`
-- --------------------------------------------------------
CREATE TABLE `tabFile` (
  `name` varchar(255) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(255) DEFAULT NULL,
  `parentfield` varchar(255) DEFAULT NULL,
  `parenttype` varchar(255) DEFAULT NULL,
  `idx` int(8) NOT NULL DEFAULT 0,
  `file_name` varchar(140) DEFAULT NULL,
  `file_url` longtext DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `attached_to_name` varchar(140) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL DEFAULT 0,
  `attached_to_doctype` varchar(140) DEFAULT NULL,
  `is_private` int(1) NOT NULL DEFAULT 0,
  `file_type` varchar(140) DEFAULT NULL,
  `is_home_folder` int(1) NOT NULL DEFAULT 0,
  `is_attachments_folder` int(1) NOT NULL DEFAULT 0,
  `thumbnail_url` text DEFAULT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `is_folder` int(1) NOT NULL DEFAULT 0,
  `attached_to_field` varchar(140) DEFAULT NULL,
  `old_parent` varchar(140) DEFAULT NULL,
  `content_hash` varchar(140) DEFAULT NULL,
  `uploaded_to_dropbox` int(1) NOT NULL DEFAULT 0,
  `uploaded_to_google_drive` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`),
  KEY `is_home_folder_index` (`is_home_folder`),
  KEY `attached_to_doctype_attached_to_name_index` (`attached_to_doctype`,`attached_to_name`),
  KEY `file_url_index` (`file_url`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabForm Tour`
-- --------------------------------------------------------
CREATE TABLE `tabForm Tour` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `view_name` varchar(140) DEFAULT NULL,
  `workspace_name` varchar(140) DEFAULT NULL,
  `list_name` varchar(140) DEFAULT 'List',
  `report_name` varchar(140) DEFAULT NULL,
  `dashboard_name` varchar(140) DEFAULT NULL,
  `new_document_form` int(1) NOT NULL DEFAULT 0,
  `page_name` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `ui_tour` int(1) NOT NULL DEFAULT 0,
  `track_steps` int(1) NOT NULL DEFAULT 0,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `save_on_complete` int(1) NOT NULL DEFAULT 0,
  `first_document` int(1) NOT NULL DEFAULT 0,
  `include_name_field` int(1) NOT NULL DEFAULT 0,
  `page_route` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `title` (`title`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabForm Tour Step`
-- --------------------------------------------------------
CREATE TABLE `tabForm Tour Step` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `ui_tour` int(1) NOT NULL DEFAULT 0,
  `is_table_field` int(1) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `parent_fieldname` varchar(140) DEFAULT NULL,
  `fieldname` varchar(140) DEFAULT NULL,
  `element_selector` varchar(140) DEFAULT NULL,
  `parent_element_selector` varchar(140) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `ondemand_description` longtext DEFAULT NULL,
  `position` varchar(140) DEFAULT 'Bottom',
  `hide_buttons` int(1) NOT NULL DEFAULT 0,
  `popover_element` int(1) NOT NULL DEFAULT 0,
  `modal_trigger` int(1) NOT NULL DEFAULT 0,
  `offset_x` int(11) NOT NULL DEFAULT 0,
  `offset_y` int(11) NOT NULL DEFAULT 0,
  `next_on_click` int(1) NOT NULL DEFAULT 0,
  `label` varchar(140) DEFAULT NULL,
  `fieldtype` varchar(140) DEFAULT '0',
  `has_next_condition` int(1) NOT NULL DEFAULT 0,
  `next_step_condition` longtext DEFAULT NULL,
  `next_form_tour` varchar(140) DEFAULT NULL,
  `child_doctype` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabGender`
-- --------------------------------------------------------
CREATE TABLE `tabGender` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `gender` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `gender` (`gender`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabGlobal Search DocType`
-- --------------------------------------------------------
CREATE TABLE `tabGlobal Search DocType` (
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


-- --------------------------------------------------------
-- Table structure for `tabGoogle Calendar`
-- --------------------------------------------------------
CREATE TABLE `tabGoogle Calendar` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `enable` int(1) NOT NULL DEFAULT 1,
  `calendar_name` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `pull_from_google_calendar` int(1) NOT NULL DEFAULT 1,
  `sync_as_public` int(1) NOT NULL DEFAULT 0,
  `push_to_google_calendar` int(1) NOT NULL DEFAULT 1,
  `google_calendar_id` varchar(140) DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `authorization_code` text DEFAULT NULL,
  `next_sync_token` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `calendar_name` (`calendar_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabGoogle Contacts`
-- --------------------------------------------------------
CREATE TABLE `tabGoogle Contacts` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `enable` int(1) NOT NULL DEFAULT 0,
  `email_id` varchar(140) DEFAULT NULL,
  `last_sync_on` datetime(6) DEFAULT NULL,
  `authorization_code` text DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `next_sync_token` text DEFAULT NULL,
  `pull_from_google_contacts` int(1) NOT NULL DEFAULT 0,
  `push_to_google_contacts` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabHas Domain`
-- --------------------------------------------------------
CREATE TABLE `tabHas Domain` (
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


-- --------------------------------------------------------
-- Table structure for `tabHas Role`
-- --------------------------------------------------------
CREATE TABLE `tabHas Role` (
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


-- --------------------------------------------------------
-- Table structure for `tabHelp Article`
-- --------------------------------------------------------
CREATE TABLE `tabHelp Article` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `category` varchar(140) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `author` varchar(140) DEFAULT 'user_fullname',
  `level` varchar(140) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `route` varchar(140) DEFAULT NULL,
  `helpful` int(11) NOT NULL DEFAULT 0,
  `not_helpful` int(11) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabHelp Category`
-- --------------------------------------------------------
CREATE TABLE `tabHelp Category` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `category_name` varchar(140) DEFAULT NULL,
  `category_description` text DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `help_articles` int(11) NOT NULL DEFAULT 0,
  `route` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabIMAP Folder`
-- --------------------------------------------------------
CREATE TABLE `tabIMAP Folder` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `folder_name` varchar(140) DEFAULT NULL,
  `append_to` varchar(140) DEFAULT NULL,
  `uidvalidity` varchar(140) DEFAULT NULL,
  `uidnext` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabInstalled Application`
-- --------------------------------------------------------
CREATE TABLE `tabInstalled Application` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `app_name` varchar(140) DEFAULT NULL,
  `app_version` varchar(140) DEFAULT NULL,
  `git_branch` varchar(140) DEFAULT NULL,
  `has_setup_wizard` int(1) NOT NULL DEFAULT 0,
  `is_setup_complete` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabIntegration Request`
-- --------------------------------------------------------
CREATE TABLE `tabIntegration Request` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `request_id` varchar(140) DEFAULT NULL,
  `integration_request_service` varchar(140) DEFAULT NULL,
  `is_remote_request` int(1) NOT NULL DEFAULT 0,
  `request_description` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT 'Queued',
  `url` text DEFAULT NULL,
  `request_headers` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `output` longtext DEFAULT NULL,
  `error` longtext DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_docname` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabKanban Board`
-- --------------------------------------------------------
CREATE TABLE `tabKanban Board` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `kanban_board_name` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `field_name` varchar(140) DEFAULT NULL,
  `private` int(1) NOT NULL DEFAULT 0,
  `show_labels` int(1) NOT NULL DEFAULT 0,
  `filters` longtext DEFAULT NULL,
  `fields` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `kanban_board_name` (`kanban_board_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabKanban Board Column`
-- --------------------------------------------------------
CREATE TABLE `tabKanban Board Column` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `column_name` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT 'Active',
  `indicator` varchar(140) DEFAULT 'Gray',
  `order` longtext DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabLDAP Group Mapping`
-- --------------------------------------------------------
CREATE TABLE `tabLDAP Group Mapping` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `ldap_group` varchar(140) DEFAULT NULL,
  `erpnext_role` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabLanguage`
-- --------------------------------------------------------
CREATE TABLE `tabLanguage` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `language_code` varchar(140) DEFAULT NULL,
  `language_name` varchar(140) DEFAULT NULL,
  `flag` varchar(140) DEFAULT NULL,
  `based_on` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `language_code` (`language_code`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabLead Sync Source`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabLetter Head`
-- --------------------------------------------------------
CREATE TABLE `tabLetter Head` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `letter_head_name` varchar(140) DEFAULT NULL,
  `source` varchar(140) DEFAULT NULL,
  `footer_source` varchar(140) DEFAULT 'HTML',
  `disabled` int(1) NOT NULL DEFAULT 0,
  `is_default` int(1) NOT NULL DEFAULT 0,
  `image` text DEFAULT NULL,
  `image_height` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `image_width` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `align` varchar(140) DEFAULT 'Left',
  `content` longtext DEFAULT NULL,
  `footer` longtext DEFAULT NULL,
  `footer_image` text DEFAULT NULL,
  `footer_image_height` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `footer_image_width` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `footer_align` varchar(140) DEFAULT NULL,
  `header_script` longtext DEFAULT NULL,
  `footer_script` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `letter_head_name` (`letter_head_name`),
  KEY `is_default` (`is_default`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabList Filter`
-- --------------------------------------------------------
CREATE TABLE `tabList Filter` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `filter_name` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `for_user` varchar(140) DEFAULT NULL,
  `filters` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabList View Settings`
-- --------------------------------------------------------
CREATE TABLE `tabList View Settings` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `disable_count` int(1) NOT NULL DEFAULT 0,
  `disable_comment_count` int(1) NOT NULL DEFAULT 0,
  `disable_sidebar_stats` int(1) NOT NULL DEFAULT 0,
  `disable_auto_refresh` int(1) NOT NULL DEFAULT 0,
  `allow_edit` int(1) NOT NULL DEFAULT 0,
  `disable_automatic_recency_filters` int(1) NOT NULL DEFAULT 0,
  `total_fields` varchar(140) DEFAULT NULL,
  `fields` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabLog Setting User`
-- --------------------------------------------------------
CREATE TABLE `tabLog Setting User` (
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
  UNIQUE KEY `user` (`user`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabLogs To Clear`
-- --------------------------------------------------------
CREATE TABLE `tabLogs To Clear` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `ref_doctype` varchar(140) DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT 30,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabMarketing Campaign`
-- --------------------------------------------------------
CREATE TABLE `tabMarketing Campaign` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `campaign_description` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabMilestone`
-- --------------------------------------------------------
CREATE TABLE `tabMilestone` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `reference_type` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `track_field` varchar(140) DEFAULT NULL,
  `value` varchar(140) DEFAULT NULL,
  `milestone_tracker` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `reference_type` (`reference_type`),
  KEY `modified` (`modified`),
  KEY `reference_type_reference_name_index` (`reference_type`,`reference_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabMilestone Tracker`
-- --------------------------------------------------------
CREATE TABLE `tabMilestone Tracker` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `track_field` varchar(140) DEFAULT NULL,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `document_type` (`document_type`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabModule Def`
-- --------------------------------------------------------
CREATE TABLE `tabModule Def` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `module_name` varchar(140) DEFAULT NULL,
  `custom` int(1) NOT NULL DEFAULT 0,
  `package` varchar(140) DEFAULT NULL,
  `app_name` varchar(140) DEFAULT NULL,
  `restrict_to_domain` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `module_name` (`module_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabModule Onboarding`
-- --------------------------------------------------------
CREATE TABLE `tabModule Onboarding` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `subtitle` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `success_message` varchar(140) DEFAULT NULL,
  `documentation_url` varchar(140) DEFAULT NULL,
  `is_complete` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabModule Profile`
-- --------------------------------------------------------
CREATE TABLE `tabModule Profile` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `module_profile_name` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `module_profile_name` (`module_profile_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNavbar Item`
-- --------------------------------------------------------
CREATE TABLE `tabNavbar Item` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `item_label` varchar(140) DEFAULT NULL,
  `item_type` varchar(140) DEFAULT NULL,
  `route` varchar(140) DEFAULT NULL,
  `action` varchar(140) DEFAULT NULL,
  `hidden` int(1) NOT NULL DEFAULT 0,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `condition` longtext DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNetwork Printer Settings`
-- --------------------------------------------------------
CREATE TABLE `tabNetwork Printer Settings` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `server_ip` varchar(140) DEFAULT 'localhost',
  `port` int(11) NOT NULL DEFAULT 631,
  `printer_name` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNewsletter`
-- --------------------------------------------------------
CREATE TABLE `tabNewsletter` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email_sent_at` datetime(6) DEFAULT NULL,
  `total_recipients` int(11) NOT NULL DEFAULT 0,
  `total_views` int(11) NOT NULL DEFAULT 0,
  `email_sent` int(1) NOT NULL DEFAULT 0,
  `sender_name` varchar(140) DEFAULT NULL,
  `sender_email` varchar(140) DEFAULT NULL,
  `send_from` varchar(140) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `content_type` varchar(140) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `message_md` longtext DEFAULT NULL,
  `message_html` longtext DEFAULT NULL,
  `campaign` varchar(140) DEFAULT NULL,
  `send_unsubscribe_link` int(1) NOT NULL DEFAULT 1,
  `send_webview_link` int(1) NOT NULL DEFAULT 0,
  `scheduled_to_send` int(11) NOT NULL DEFAULT 0,
  `schedule_sending` int(1) NOT NULL DEFAULT 0,
  `schedule_send` datetime(6) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `route` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNewsletter Attachment`
-- --------------------------------------------------------
CREATE TABLE `tabNewsletter Attachment` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `attachment` text DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNewsletter Email Group`
-- --------------------------------------------------------
CREATE TABLE `tabNewsletter Email Group` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email_group` varchar(140) DEFAULT NULL,
  `total_subscribers` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNote`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabNote Seen By`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabNotification`
-- --------------------------------------------------------
CREATE TABLE `tabNotification` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `module` varchar(140) DEFAULT NULL,
  `channel` varchar(140) DEFAULT 'Email',
  `slack_webhook_url` varchar(140) DEFAULT NULL,
  `subject` varchar(140) DEFAULT NULL,
  `event` varchar(140) DEFAULT NULL,
  `document_type` varchar(140) DEFAULT NULL,
  `method` varchar(140) DEFAULT NULL,
  `date_changed` varchar(140) DEFAULT NULL,
  `days_in_advance` int(11) NOT NULL DEFAULT 0,
  `value_changed` varchar(140) DEFAULT NULL,
  `sender` varchar(140) DEFAULT NULL,
  `send_system_notification` int(1) NOT NULL DEFAULT 0,
  `notification_type` varchar(140) DEFAULT 'Alert',
  `notification_title` varchar(140) DEFAULT NULL,
  `notification_message` text DEFAULT NULL,
  `sender_email` varchar(140) DEFAULT NULL,
  `condition` longtext DEFAULT NULL,
  `set_property_after_alert` varchar(140) DEFAULT NULL,
  `property_value` varchar(140) DEFAULT NULL,
  `send_to_all_assignees` int(1) NOT NULL DEFAULT 0,
  `message_type` varchar(140) DEFAULT 'Markdown',
  `message` longtext DEFAULT 'Add your message here',
  `attach_print` int(1) NOT NULL DEFAULT 0,
  `print_format` varchar(140) DEFAULT NULL,
  `attach_files` varchar(140) DEFAULT NULL,
  `from_attach_field` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `event` (`event`),
  KEY `document_type` (`document_type`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNotification Log`
-- --------------------------------------------------------
CREATE TABLE `tabNotification Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `document_type` varchar(140) DEFAULT NULL,
  `document_name` varchar(140) DEFAULT NULL,
  `source_doctype` varchar(140) DEFAULT NULL,
  `source_name` varchar(140) DEFAULT NULL,
  `app` varchar(140) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `for_user` varchar(140) DEFAULT NULL,
  `from_user` varchar(140) DEFAULT NULL,
  `read` int(1) NOT NULL DEFAULT 0,
  `attached_file` longtext DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `email_content` longtext DEFAULT NULL,
  `email_header` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `_seen` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `document_name` (`document_name`),
  KEY `app` (`app`),
  KEY `for_user` (`for_user`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNotification Recipient`
-- --------------------------------------------------------
CREATE TABLE `tabNotification Recipient` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `receiver_by_document_field` varchar(140) DEFAULT NULL,
  `receiver_by_role` varchar(140) DEFAULT NULL,
  `cc` longtext DEFAULT NULL,
  `bcc` longtext DEFAULT NULL,
  `condition` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNotification Settings`
-- --------------------------------------------------------
CREATE TABLE `tabNotification Settings` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `enable_email_notifications` int(1) NOT NULL DEFAULT 1,
  `enable_email_threads_on_assigned_document` int(1) NOT NULL DEFAULT 1,
  `enable_email_event_reminders` int(1) NOT NULL DEFAULT 1,
  `enable_email_mention` int(1) NOT NULL DEFAULT 1,
  `enable_email_assignment` int(1) NOT NULL DEFAULT 1,
  `enable_email_energy_point` int(1) NOT NULL DEFAULT 1,
  `enable_email_share` int(1) NOT NULL DEFAULT 1,
  `seen` int(1) NOT NULL DEFAULT 0,
  `energy_points_system_notifications` int(1) NOT NULL DEFAULT 1,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNotification Subscribed Document`
-- --------------------------------------------------------
CREATE TABLE `tabNotification Subscribed Document` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNotification Type`
-- --------------------------------------------------------
CREATE TABLE `tabNotification Type` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `type_name` varchar(140) DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `type_name` (`type_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNotification Type Preference`
-- --------------------------------------------------------
CREATE TABLE `tabNotification Type Preference` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `notification_type` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNumber Card`
-- --------------------------------------------------------
CREATE TABLE `tabNumber Card` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `module` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `type` varchar(140) DEFAULT NULL,
  `report_name` varchar(140) DEFAULT NULL,
  `method` varchar(140) DEFAULT NULL,
  `function` varchar(140) DEFAULT NULL,
  `aggregate_function_based_on` varchar(140) DEFAULT NULL,
  `document_type` varchar(140) DEFAULT NULL,
  `parent_document_type` varchar(140) DEFAULT NULL,
  `report_field` varchar(140) DEFAULT NULL,
  `report_function` varchar(140) DEFAULT NULL,
  `is_public` int(1) NOT NULL DEFAULT 0,
  `currency` varchar(140) DEFAULT NULL,
  `show_full_number` int(1) NOT NULL DEFAULT 0,
  `filters_config` longtext DEFAULT NULL,
  `show_percentage_stats` int(1) NOT NULL DEFAULT 1,
  `stats_time_interval` varchar(140) DEFAULT 'Daily',
  `filters_json` longtext DEFAULT NULL,
  `dynamic_filters_json` longtext DEFAULT NULL,
  `color` varchar(140) DEFAULT NULL,
  `background_color` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabNumber Card Link`
-- --------------------------------------------------------
CREATE TABLE `tabNumber Card Link` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `card` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabOAuth Authorization Code`
-- --------------------------------------------------------
CREATE TABLE `tabOAuth Authorization Code` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `client` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `authorization_code` varchar(140) DEFAULT NULL,
  `expiration_time` datetime(6) DEFAULT NULL,
  `redirect_uri_bound_to_authorization_code` varchar(140) DEFAULT NULL,
  `validity` varchar(140) DEFAULT NULL,
  `nonce` varchar(140) DEFAULT NULL,
  `code_challenge` varchar(140) DEFAULT NULL,
  `code_challenge_method` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `authorization_code` (`authorization_code`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabOAuth Bearer Token`
-- --------------------------------------------------------
CREATE TABLE `tabOAuth Bearer Token` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `client` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `access_token` varchar(140) DEFAULT NULL,
  `refresh_token` varchar(140) DEFAULT NULL,
  `expiration_time` datetime(6) DEFAULT NULL,
  `expires_in` int(11) NOT NULL DEFAULT 0,
  `status` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `access_token` (`access_token`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabOAuth Client`
-- --------------------------------------------------------
CREATE TABLE `tabOAuth Client` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `client_id` varchar(140) DEFAULT NULL,
  `app_name` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `client_secret` varchar(140) DEFAULT NULL,
  `skip_authorization` int(1) NOT NULL DEFAULT 0,
  `scopes` text DEFAULT 'all openid',
  `redirect_uris` text DEFAULT NULL,
  `default_redirect_uri` varchar(140) DEFAULT NULL,
  `grant_type` varchar(140) DEFAULT NULL,
  `response_type` varchar(140) DEFAULT 'Code',
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabOAuth Client Role`
-- --------------------------------------------------------
CREATE TABLE `tabOAuth Client Role` (
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


-- --------------------------------------------------------
-- Table structure for `tabOAuth Scope`
-- --------------------------------------------------------
CREATE TABLE `tabOAuth Scope` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `scope` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabOnboarding Permission`
-- --------------------------------------------------------
CREATE TABLE `tabOnboarding Permission` (
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


-- --------------------------------------------------------
-- Table structure for `tabOnboarding Step`
-- --------------------------------------------------------
CREATE TABLE `tabOnboarding Step` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `is_complete` int(1) NOT NULL DEFAULT 0,
  `is_skipped` int(1) NOT NULL DEFAULT 0,
  `description` longtext DEFAULT NULL,
  `intro_video_url` varchar(140) DEFAULT NULL,
  `action` varchar(140) DEFAULT NULL,
  `action_label` varchar(140) DEFAULT NULL,
  `reference_document` varchar(140) DEFAULT NULL,
  `show_full_form` int(1) NOT NULL DEFAULT 0,
  `show_form_tour` int(1) NOT NULL DEFAULT 0,
  `form_tour` varchar(140) DEFAULT NULL,
  `is_single` int(1) NOT NULL DEFAULT 0,
  `reference_report` varchar(140) DEFAULT NULL,
  `report_reference_doctype` varchar(140) DEFAULT NULL,
  `report_type` varchar(140) DEFAULT NULL,
  `report_description` varchar(140) DEFAULT NULL,
  `path` varchar(140) DEFAULT NULL,
  `callback_title` varchar(140) DEFAULT NULL,
  `callback_message` text DEFAULT NULL,
  `validate_action` int(1) NOT NULL DEFAULT 1,
  `field` varchar(140) DEFAULT NULL,
  `value_to_validate` varchar(140) DEFAULT NULL,
  `video_url` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabOnboarding Step Map`
-- --------------------------------------------------------
CREATE TABLE `tabOnboarding Step Map` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `step` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPackage`
-- --------------------------------------------------------
CREATE TABLE `tabPackage` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `package_name` varchar(140) DEFAULT NULL,
  `readme` longtext DEFAULT NULL,
  `license_type` varchar(140) DEFAULT NULL,
  `license` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPackage Import`
-- --------------------------------------------------------
CREATE TABLE `tabPackage Import` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `attach_package` text DEFAULT NULL,
  `activate` int(1) NOT NULL DEFAULT 0,
  `force` int(1) NOT NULL DEFAULT 0,
  `log` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPackage Release`
-- --------------------------------------------------------
CREATE TABLE `tabPackage Release` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `package` varchar(140) DEFAULT NULL,
  `publish` int(1) NOT NULL DEFAULT 0,
  `path` text DEFAULT NULL,
  `major` int(11) NOT NULL DEFAULT 0,
  `minor` int(11) NOT NULL DEFAULT 0,
  `patch` int(11) NOT NULL DEFAULT 0,
  `release_notes` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPage`
-- --------------------------------------------------------
CREATE TABLE `tabPage` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `system_page` int(1) NOT NULL DEFAULT 0,
  `page_name` varchar(140) DEFAULT NULL,
  `title` varchar(140) DEFAULT NULL,
  `icon` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `restrict_to_domain` varchar(140) DEFAULT NULL,
  `standard` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `page_name` (`page_name`),
  KEY `standard` (`standard`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPatch Log`
-- --------------------------------------------------------
CREATE TABLE `tabPatch Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `patch` longtext DEFAULT NULL,
  `skipped` int(1) NOT NULL DEFAULT 0,
  `traceback` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPersonal Data Deletion Request`
-- --------------------------------------------------------
CREATE TABLE `tabPersonal Data Deletion Request` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT 'Pending Verification',
  `anonymization_matrix` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPersonal Data Deletion Step`
-- --------------------------------------------------------
CREATE TABLE `tabPersonal Data Deletion Step` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `status` varchar(140) DEFAULT NULL,
  `partial` int(1) NOT NULL DEFAULT 0,
  `fields` text DEFAULT NULL,
  `filtered_by` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPersonal Data Download Request`
-- --------------------------------------------------------
CREATE TABLE `tabPersonal Data Download Request` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `user_name` varchar(140) DEFAULT NULL,
  `amended_from` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPortal Menu Item`
-- --------------------------------------------------------
CREATE TABLE `tabPortal Menu Item` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 0,
  `route` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `role` varchar(140) DEFAULT NULL,
  `target` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPrepared Report`
-- --------------------------------------------------------
CREATE TABLE `tabPrepared Report` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `status` varchar(140) DEFAULT 'Queued',
  `report_name` varchar(140) DEFAULT NULL,
  `job_id` varchar(140) DEFAULT NULL,
  `report_end_time` datetime(6) DEFAULT NULL,
  `peak_memory_usage` int(11) NOT NULL DEFAULT 0,
  `error_message` longtext DEFAULT NULL,
  `filters` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `status` (`status`),
  KEY `report_name` (`report_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPrint Format`
-- --------------------------------------------------------
CREATE TABLE `tabPrint Format` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `print_format_for` varchar(140) DEFAULT 'DocType',
  `doc_type` varchar(140) DEFAULT NULL,
  `report` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `default_print_language` varchar(140) DEFAULT NULL,
  `standard` varchar(140) DEFAULT 'No',
  `custom_format` int(1) NOT NULL DEFAULT 0,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `pdf_generator` varchar(140) DEFAULT 'wkhtmltopdf',
  `print_format_type` varchar(140) DEFAULT 'Jinja',
  `raw_printing` int(1) NOT NULL DEFAULT 0,
  `html` longtext DEFAULT NULL,
  `raw_commands` longtext DEFAULT NULL,
  `margin_top` decimal(21,9) NOT NULL DEFAULT 15.000000000,
  `margin_bottom` decimal(21,9) NOT NULL DEFAULT 15.000000000,
  `margin_left` decimal(21,9) NOT NULL DEFAULT 15.000000000,
  `margin_right` decimal(21,9) NOT NULL DEFAULT 15.000000000,
  `align_labels_right` int(1) NOT NULL DEFAULT 0,
  `show_section_headings` int(1) NOT NULL DEFAULT 0,
  `line_breaks` int(1) NOT NULL DEFAULT 0,
  `absolute_value` int(1) NOT NULL DEFAULT 0,
  `font_size` int(11) NOT NULL DEFAULT 14,
  `font` varchar(140) DEFAULT NULL,
  `page_number` varchar(140) DEFAULT 'Hide',
  `css` longtext DEFAULT NULL,
  `format_data` longtext DEFAULT NULL,
  `print_format_builder` int(1) NOT NULL DEFAULT 0,
  `print_format_builder_beta` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `standard` (`standard`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPrint Format Field Template`
-- --------------------------------------------------------
CREATE TABLE `tabPrint Format Field Template` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `field` varchar(140) DEFAULT NULL,
  `template_file` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `standard` int(1) NOT NULL DEFAULT 0,
  `template` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPrint Heading`
-- --------------------------------------------------------
CREATE TABLE `tabPrint Heading` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `print_heading` varchar(140) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabPrint Style`
-- --------------------------------------------------------
CREATE TABLE `tabPrint Style` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `print_style_name` varchar(140) DEFAULT NULL,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `standard` int(1) NOT NULL DEFAULT 0,
  `css` longtext DEFAULT NULL,
  `preview` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `print_style_name` (`print_style_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabProperty Setter`
-- --------------------------------------------------------
CREATE TABLE `tabProperty Setter` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `is_system_generated` int(1) NOT NULL DEFAULT 0,
  `doctype_or_field` varchar(140) DEFAULT NULL,
  `doc_type` varchar(140) DEFAULT NULL,
  `field_name` varchar(140) DEFAULT NULL,
  `row_name` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `property` varchar(140) DEFAULT NULL,
  `property_type` varchar(140) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `default_value` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `doc_type` (`doc_type`),
  KEY `field_name` (`field_name`),
  KEY `property` (`property`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabQuery Parameters`
-- --------------------------------------------------------
CREATE TABLE `tabQuery Parameters` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `key` varchar(140) DEFAULT NULL,
  `value` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabReminder`
-- --------------------------------------------------------
CREATE TABLE `tabReminder` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `remind_at` datetime(6) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `reminder_doctype` varchar(140) DEFAULT NULL,
  `reminder_docname` varchar(140) DEFAULT NULL,
  `notified` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `user` (`user`),
  KEY `remind_at` (`remind_at`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabReport`
-- --------------------------------------------------------
CREATE TABLE `tabReport` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `report_name` varchar(140) DEFAULT NULL,
  `ref_doctype` varchar(140) DEFAULT NULL,
  `reference_report` varchar(140) DEFAULT NULL,
  `is_standard` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `report_type` varchar(140) DEFAULT NULL,
  `letter_head` varchar(140) DEFAULT NULL,
  `add_total_row` int(1) NOT NULL DEFAULT 0,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `prepared_report` int(1) NOT NULL DEFAULT 0,
  `snapshot_report` int(1) NOT NULL DEFAULT 0,
  `disable_prepared_report_automation` int(1) NOT NULL DEFAULT 0,
  `add_translate_data` int(1) NOT NULL DEFAULT 0,
  `timeout` int(11) NOT NULL DEFAULT 0,
  `query` longtext DEFAULT NULL,
  `report_script` longtext DEFAULT NULL,
  `javascript` longtext DEFAULT NULL,
  `json` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `report_name` (`report_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabReport Column`
-- --------------------------------------------------------
CREATE TABLE `tabReport Column` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `fieldname` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `fieldtype` varchar(140) DEFAULT NULL,
  `options` varchar(140) DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabReport Filter`
-- --------------------------------------------------------
CREATE TABLE `tabReport Filter` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `label` varchar(140) DEFAULT NULL,
  `fieldtype` varchar(140) DEFAULT NULL,
  `fieldname` varchar(140) DEFAULT NULL,
  `mandatory` int(1) NOT NULL DEFAULT 0,
  `wildcard_filter` int(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `default` text DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabReview Level`
-- --------------------------------------------------------
CREATE TABLE `tabReview Level` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `level_name` varchar(140) DEFAULT NULL,
  `role` varchar(140) DEFAULT NULL,
  `review_points` int(11) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `level_name` (`level_name`),
  UNIQUE KEY `role` (`role`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabRole`
-- --------------------------------------------------------
CREATE TABLE `tabRole` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `role_name` varchar(140) DEFAULT NULL,
  `home_page` varchar(140) DEFAULT NULL,
  `restrict_to_domain` varchar(140) DEFAULT NULL,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `is_custom` int(1) NOT NULL DEFAULT 0,
  `desk_access` int(1) NOT NULL DEFAULT 1,
  `two_factor_auth` int(1) NOT NULL DEFAULT 0,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `role_name` (`role_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabRole Profile`
-- --------------------------------------------------------
CREATE TABLE `tabRole Profile` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `role_profile` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `role_profile` (`role_profile`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabRoute History`
-- --------------------------------------------------------
CREATE TABLE `tabRoute History` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `route` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSMS Parameter`
-- --------------------------------------------------------
CREATE TABLE `tabSMS Parameter` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `parameter` varchar(140) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `header` int(1) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSalutation`
-- --------------------------------------------------------
CREATE TABLE `tabSalutation` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `salutation` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `salutation` (`salutation`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabScheduled Job Log`
-- --------------------------------------------------------
CREATE TABLE `tabScheduled Job Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `status` varchar(140) DEFAULT NULL,
  `scheduled_job_type` varchar(140) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `debug_log` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabScheduled Job Type`
-- --------------------------------------------------------
CREATE TABLE `tabScheduled Job Type` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `stopped` int(1) NOT NULL DEFAULT 0,
  `method` varchar(140) DEFAULT NULL,
  `server_script` varchar(140) DEFAULT NULL,
  `scheduler_event` varchar(140) DEFAULT NULL,
  `frequency` varchar(140) DEFAULT NULL,
  `cron_format` varchar(140) DEFAULT NULL,
  `create_log` int(1) NOT NULL DEFAULT 0,
  `last_execution` datetime(6) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `server_script` (`server_script`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabScheduler Event`
-- --------------------------------------------------------
CREATE TABLE `tabScheduler Event` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `scheduled_against` varchar(140) DEFAULT NULL,
  `method` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSecurity Settings Contact`
-- --------------------------------------------------------
CREATE TABLE `tabSecurity Settings Contact` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT NULL,
  `contact` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSecurity Settings Language`
-- --------------------------------------------------------
CREATE TABLE `tabSecurity Settings Language` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `language` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSeries`
-- --------------------------------------------------------
CREATE TABLE `tabSeries` (
  `name` varchar(100) NOT NULL,
  `current` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabServer Script`
-- --------------------------------------------------------
CREATE TABLE `tabServer Script` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `script_type` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `event_frequency` varchar(140) DEFAULT NULL,
  `cron_format` varchar(140) DEFAULT NULL,
  `doctype_event` varchar(140) DEFAULT NULL,
  `api_method` varchar(140) DEFAULT NULL,
  `allow_guest` int(1) NOT NULL DEFAULT 0,
  `module` varchar(140) DEFAULT NULL,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `script` longtext DEFAULT NULL,
  `enable_rate_limit` int(1) NOT NULL DEFAULT 0,
  `rate_limit_count` int(11) NOT NULL DEFAULT 5,
  `rate_limit_seconds` int(11) NOT NULL DEFAULT 86400,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `reference_doctype` (`reference_doctype`),
  KEY `module` (`module`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSession Default`
-- --------------------------------------------------------
CREATE TABLE `tabSession Default` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `ref_doctype` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSessions`
-- --------------------------------------------------------
CREATE TABLE `tabSessions` (
  `user` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `sessiondata` longtext DEFAULT NULL,
  `ipaddress` varchar(16) DEFAULT NULL,
  `lastupdate` datetime(6) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSingles`
-- --------------------------------------------------------
CREATE TABLE `tabSingles` (
  `doctype` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  KEY `singles_doctype_field_index` (`doctype`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSlack Webhook URL`
-- --------------------------------------------------------
CREATE TABLE `tabSlack Webhook URL` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `webhook_name` varchar(140) DEFAULT NULL,
  `webhook_url` varchar(140) DEFAULT NULL,
  `show_document_link` int(1) NOT NULL DEFAULT 1,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `webhook_name` (`webhook_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSocial Link Settings`
-- --------------------------------------------------------
CREATE TABLE `tabSocial Link Settings` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `social_link_type` varchar(140) DEFAULT NULL,
  `color` varchar(140) DEFAULT NULL,
  `background_color` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSocial Login Key`
-- --------------------------------------------------------
CREATE TABLE `tabSocial Login Key` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `enable_social_login` int(1) NOT NULL DEFAULT 0,
  `social_login_provider` varchar(140) DEFAULT 'Custom',
  `client_id` varchar(140) DEFAULT NULL,
  `provider_name` varchar(140) DEFAULT NULL,
  `client_secret` text DEFAULT NULL,
  `icon` varchar(140) DEFAULT NULL,
  `base_url` varchar(140) DEFAULT NULL,
  `sign_ups` varchar(140) DEFAULT NULL,
  `authorize_url` varchar(140) DEFAULT NULL,
  `access_token_url` varchar(140) DEFAULT NULL,
  `redirect_url` varchar(140) DEFAULT NULL,
  `api_endpoint` varchar(140) DEFAULT NULL,
  `custom_base_url` int(1) NOT NULL DEFAULT 0,
  `api_endpoint_args` longtext DEFAULT NULL,
  `auth_url_data` longtext DEFAULT NULL,
  `user_id_property` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSubmission Queue`
-- --------------------------------------------------------
CREATE TABLE `tabSubmission Queue` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `status` varchar(140) DEFAULT NULL,
  `job_id` varchar(140) DEFAULT NULL,
  `ended_at` datetime(6) DEFAULT NULL,
  `ref_doctype` varchar(140) DEFAULT NULL,
  `ref_docname` varchar(140) DEFAULT NULL,
  `exception` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `ref_docname` (`ref_docname`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabSuccess Action`
-- --------------------------------------------------------
CREATE TABLE `tabSuccess Action` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `ref_doctype` varchar(140) DEFAULT NULL,
  `first_success_message` varchar(140) DEFAULT 'Congratulations on first creations',
  `message` varchar(140) DEFAULT 'Successfully created',
  `next_actions` varchar(140) DEFAULT NULL,
  `action_timeout` int(11) NOT NULL DEFAULT 7,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `ref_doctype` (`ref_doctype`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabTag`
-- --------------------------------------------------------
CREATE TABLE `tabTag` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabTag Link`
-- --------------------------------------------------------
CREATE TABLE `tabTag Link` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `document_name` varchar(140) DEFAULT NULL,
  `tag` varchar(140) DEFAULT NULL,
  `title` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `document_type_document_name_index` (`document_type`,`document_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabToDo`
-- --------------------------------------------------------
CREATE TABLE `tabToDo` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `status` varchar(140) DEFAULT 'Open',
  `priority` varchar(140) DEFAULT 'Medium',
  `color` varchar(140) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `allocated_to` varchar(140) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `reference_type` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `role` varchar(140) DEFAULT NULL,
  `assigned_by` varchar(140) DEFAULT NULL,
  `assigned_by_full_name` varchar(140) DEFAULT NULL,
  `sender` varchar(140) DEFAULT NULL,
  `assignment_rule` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `_seen` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `reference_type_reference_name_index` (`reference_type`,`reference_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabToken Cache`
-- --------------------------------------------------------
CREATE TABLE `tabToken Cache` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `connected_app` varchar(140) DEFAULT NULL,
  `provider_name` varchar(140) DEFAULT NULL,
  `access_token` text DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `expires_in` int(11) NOT NULL DEFAULT 0,
  `state` varchar(140) DEFAULT NULL,
  `success_uri` varchar(140) DEFAULT NULL,
  `token_type` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabTop Bar Item`
-- --------------------------------------------------------
CREATE TABLE `tabTop Bar Item` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `label` varchar(140) DEFAULT NULL,
  `url` varchar(140) DEFAULT NULL,
  `open_in_new_tab` int(1) NOT NULL DEFAULT 0,
  `right` int(1) NOT NULL DEFAULT 1,
  `parent_label` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabTransaction Log`
-- --------------------------------------------------------
CREATE TABLE `tabTransaction Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `row_index` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `document_name` varchar(140) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `checksum_version` varchar(140) DEFAULT NULL,
  `previous_hash` text DEFAULT NULL,
  `transaction_hash` text DEFAULT NULL,
  `chaining_hash` text DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `amended_from` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabTranslation`
-- --------------------------------------------------------
CREATE TABLE `tabTranslation` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `contributed` int(1) NOT NULL DEFAULT 0,
  `language` varchar(140) DEFAULT NULL,
  `source_text` longtext DEFAULT NULL,
  `context` varchar(140) DEFAULT NULL,
  `translated_text` longtext DEFAULT NULL,
  `contribution_status` varchar(140) DEFAULT NULL,
  `contribution_docname` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `language` (`language`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabUnhandled Email`
-- --------------------------------------------------------
CREATE TABLE `tabUnhandled Email` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `email_account` varchar(140) DEFAULT NULL,
  `uid` varchar(140) DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `message_id` longtext DEFAULT NULL,
  `raw` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabUser`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Document Type`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Email`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Group`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Group Member`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Invitation`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Permission`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Role`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Select Document Type`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Social Login`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Type`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabUser Type Module`
-- --------------------------------------------------------
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


-- --------------------------------------------------------
-- Table structure for `tabVersion`
-- --------------------------------------------------------
CREATE TABLE `tabVersion` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `ref_doctype` varchar(140) DEFAULT NULL,
  `docname` varchar(140) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `ref_doctype_docname_index` (`ref_doctype`,`docname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED;


-- --------------------------------------------------------
-- Table structure for `tabView Log`
-- --------------------------------------------------------
CREATE TABLE `tabView Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `viewed_by` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `reference_name` (`reference_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED;


-- --------------------------------------------------------
-- Table structure for `tabWeb Form`
-- --------------------------------------------------------
CREATE TABLE `tabWeb Form` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `route` varchar(140) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `doc_type` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `is_standard` int(1) NOT NULL DEFAULT 0,
  `introduction_text` longtext DEFAULT NULL,
  `key_required` int(1) NOT NULL DEFAULT 0,
  `anonymous` int(1) NOT NULL DEFAULT 0,
  `login_required` int(1) NOT NULL DEFAULT 0,
  `apply_document_permissions` int(1) NOT NULL DEFAULT 0,
  `allow_edit` int(1) NOT NULL DEFAULT 0,
  `allow_multiple` int(1) NOT NULL DEFAULT 0,
  `allow_delete` int(1) NOT NULL DEFAULT 0,
  `allow_incomplete` int(1) NOT NULL DEFAULT 0,
  `allow_comments` int(1) NOT NULL DEFAULT 0,
  `allow_print` int(1) NOT NULL DEFAULT 0,
  `print_format` varchar(140) DEFAULT NULL,
  `max_attachment_size` int(11) NOT NULL DEFAULT 0,
  `show_attachments` int(1) NOT NULL DEFAULT 0,
  `allowed_embedding_domains` text DEFAULT NULL,
  `condition_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`condition_json`)),
  `show_list` int(1) NOT NULL DEFAULT 0,
  `list_title` varchar(140) DEFAULT NULL,
  `show_sidebar` int(1) NOT NULL DEFAULT 0,
  `website_sidebar` varchar(140) DEFAULT NULL,
  `button_label` varchar(140) DEFAULT 'Save',
  `banner_image` text DEFAULT NULL,
  `breadcrumbs` longtext DEFAULT NULL,
  `success_title` varchar(140) DEFAULT NULL,
  `success_url` varchar(140) DEFAULT NULL,
  `success_message` text DEFAULT NULL,
  `meta_title` varchar(140) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `client_script` longtext DEFAULT NULL,
  `custom_css` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  `crm_published` int(1) NOT NULL DEFAULT 0,
  `crm_hidden_defaults` longtext DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `route` (`route`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWeb Form Field`
-- --------------------------------------------------------
CREATE TABLE `tabWeb Form Field` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `fieldname` varchar(140) DEFAULT NULL,
  `fieldtype` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `allow_read_on_all_link_options` int(1) NOT NULL DEFAULT 0,
  `reqd` int(1) NOT NULL DEFAULT 0,
  `read_only` int(1) NOT NULL DEFAULT 0,
  `show_in_filter` int(1) NOT NULL DEFAULT 0,
  `hidden` int(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `max_length` int(11) NOT NULL DEFAULT 0,
  `max_value` int(11) NOT NULL DEFAULT 0,
  `precision` varchar(140) DEFAULT NULL,
  `depends_on` longtext DEFAULT NULL,
  `mandatory_depends_on` longtext DEFAULT NULL,
  `read_only_depends_on` longtext DEFAULT NULL,
  `description` text DEFAULT NULL,
  `default` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  `placeholder` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWeb Form List Column`
-- --------------------------------------------------------
CREATE TABLE `tabWeb Form List Column` (
  `name` bigint(20) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `fieldname` varchar(140) DEFAULT NULL,
  `fieldtype` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWeb Form Request`
-- --------------------------------------------------------
CREATE TABLE `tabWeb Form Request` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `web_form` varchar(140) DEFAULT NULL,
  `key` varchar(140) DEFAULT NULL,
  `expires_on` datetime(6) DEFAULT NULL,
  `first_used_on` datetime(6) DEFAULT NULL,
  `web_form_values` longtext DEFAULT NULL,
  `doc_values` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `key` (`key`),
  KEY `web_form` (`web_form`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWeb Page`
-- --------------------------------------------------------
CREATE TABLE `tabWeb Page` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `route` varchar(140) DEFAULT NULL,
  `dynamic_route` int(1) NOT NULL DEFAULT 0,
  `published` int(1) NOT NULL DEFAULT 1,
  `module` varchar(140) DEFAULT NULL,
  `content_type` varchar(140) DEFAULT 'Page Builder',
  `slideshow` varchar(140) DEFAULT NULL,
  `dynamic_template` int(1) NOT NULL DEFAULT 0,
  `main_section` longtext DEFAULT NULL,
  `main_section_md` longtext DEFAULT NULL,
  `main_section_html` longtext DEFAULT NULL,
  `context_script` longtext DEFAULT NULL,
  `javascript` longtext DEFAULT NULL,
  `insert_style` int(1) NOT NULL DEFAULT 0,
  `text_align` varchar(140) DEFAULT NULL,
  `css` longtext DEFAULT NULL,
  `full_width` int(1) NOT NULL DEFAULT 1,
  `show_title` int(1) NOT NULL DEFAULT 0,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `meta_title` varchar(140) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `show_sidebar` int(1) NOT NULL DEFAULT 0,
  `website_sidebar` varchar(140) DEFAULT NULL,
  `enable_comments` int(1) NOT NULL DEFAULT 0,
  `header` longtext DEFAULT NULL,
  `breadcrumbs` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `route` (`route`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWeb Page Block`
-- --------------------------------------------------------
CREATE TABLE `tabWeb Page Block` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `web_template` varchar(140) DEFAULT NULL,
  `web_template_values` longtext DEFAULT NULL,
  `css_class` text DEFAULT NULL,
  `section_id` varchar(140) DEFAULT NULL,
  `add_container` int(1) NOT NULL DEFAULT 1,
  `add_top_padding` int(1) NOT NULL DEFAULT 1,
  `add_bottom_padding` int(1) NOT NULL DEFAULT 1,
  `add_border_at_top` int(1) NOT NULL DEFAULT 0,
  `add_border_at_bottom` int(1) NOT NULL DEFAULT 0,
  `add_shade` int(1) NOT NULL DEFAULT 0,
  `hide_block` int(1) NOT NULL DEFAULT 0,
  `add_background_image` int(1) NOT NULL DEFAULT 0,
  `background_image` text DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWeb Page View`
-- --------------------------------------------------------
CREATE TABLE `tabWeb Page View` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `path` varchar(140) DEFAULT NULL,
  `referrer` varchar(140) DEFAULT NULL,
  `browser` varchar(140) DEFAULT NULL,
  `browser_version` varchar(140) DEFAULT NULL,
  `is_unique` varchar(140) DEFAULT NULL,
  `time_zone` varchar(140) DEFAULT NULL,
  `user_agent` varchar(140) DEFAULT NULL,
  `source` varchar(140) DEFAULT NULL,
  `campaign` varchar(140) DEFAULT NULL,
  `medium` varchar(140) DEFAULT NULL,
  `visitor_id` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `path` (`path`),
  KEY `visitor_id` (`visitor_id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED;


-- --------------------------------------------------------
-- Table structure for `tabWeb Template`
-- --------------------------------------------------------
CREATE TABLE `tabWeb Template` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT 'Section',
  `standard` int(1) NOT NULL DEFAULT 0,
  `module` varchar(140) DEFAULT NULL,
  `template` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWeb Template Field`
-- --------------------------------------------------------
CREATE TABLE `tabWeb Template Field` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `label` varchar(140) DEFAULT NULL,
  `fieldname` varchar(140) DEFAULT NULL,
  `fieldtype` varchar(140) DEFAULT 'Data',
  `reqd` int(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `default` text DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebhook`
-- --------------------------------------------------------
CREATE TABLE `tabWebhook` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `webhook_doctype` varchar(140) DEFAULT NULL,
  `webhook_docevent` varchar(140) DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `condition` text DEFAULT NULL,
  `request_url` text DEFAULT NULL,
  `is_dynamic_url` int(1) NOT NULL DEFAULT 0,
  `timeout` int(11) NOT NULL DEFAULT 5,
  `background_jobs_queue` varchar(140) DEFAULT NULL,
  `request_method` varchar(140) DEFAULT 'POST',
  `request_structure` varchar(140) DEFAULT NULL,
  `enable_security` int(1) NOT NULL DEFAULT 0,
  `webhook_secret` text DEFAULT NULL,
  `webhook_json` longtext DEFAULT NULL,
  `preview_document` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebhook Data`
-- --------------------------------------------------------
CREATE TABLE `tabWebhook Data` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `fieldname` varchar(140) DEFAULT NULL,
  `key` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebhook Header`
-- --------------------------------------------------------
CREATE TABLE `tabWebhook Header` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `key` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebhook Request Log`
-- --------------------------------------------------------
CREATE TABLE `tabWebhook Request Log` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `webhook` varchar(140) DEFAULT NULL,
  `reference_document` varchar(140) DEFAULT NULL,
  `headers` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `response` longtext DEFAULT NULL,
  `error` text DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebsite Meta Tag`
-- --------------------------------------------------------
CREATE TABLE `tabWebsite Meta Tag` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `key` varchar(140) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebsite Route Meta`
-- --------------------------------------------------------
CREATE TABLE `tabWebsite Route Meta` (
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


-- --------------------------------------------------------
-- Table structure for `tabWebsite Route Redirect`
-- --------------------------------------------------------
CREATE TABLE `tabWebsite Route Redirect` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `source` text DEFAULT NULL,
  `target` text DEFAULT NULL,
  `redirect_http_status` varchar(140) DEFAULT '301',
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebsite Sidebar`
-- --------------------------------------------------------
CREATE TABLE `tabWebsite Sidebar` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `title` (`title`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebsite Sidebar Item`
-- --------------------------------------------------------
CREATE TABLE `tabWebsite Sidebar Item` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `route` varchar(140) DEFAULT NULL,
  `group` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebsite Slideshow`
-- --------------------------------------------------------
CREATE TABLE `tabWebsite Slideshow` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `slideshow_name` varchar(140) DEFAULT NULL,
  `header` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `slideshow_name` (`slideshow_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebsite Slideshow Item`
-- --------------------------------------------------------
CREATE TABLE `tabWebsite Slideshow Item` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `image` text DEFAULT NULL,
  `heading` varchar(140) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebsite Theme`
-- --------------------------------------------------------
CREATE TABLE `tabWebsite Theme` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `theme` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT 'Website',
  `custom` int(1) NOT NULL DEFAULT 1,
  `google_font` varchar(140) DEFAULT NULL,
  `font_size` varchar(140) DEFAULT NULL,
  `font_properties` varchar(140) DEFAULT 'wght@300;400;500;600;700;800',
  `button_rounded_corners` int(1) NOT NULL DEFAULT 1,
  `button_shadows` int(1) NOT NULL DEFAULT 0,
  `button_gradients` int(1) NOT NULL DEFAULT 0,
  `primary_color` varchar(140) DEFAULT NULL,
  `text_color` varchar(140) DEFAULT NULL,
  `light_color` varchar(140) DEFAULT NULL,
  `dark_color` varchar(140) DEFAULT NULL,
  `background_color` varchar(140) DEFAULT NULL,
  `custom_overrides` longtext DEFAULT NULL,
  `custom_scss` longtext DEFAULT NULL,
  `theme_scss` longtext DEFAULT NULL,
  `theme_url` varchar(140) DEFAULT NULL,
  `js` longtext DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `theme` (`theme`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWebsite Theme Ignore App`
-- --------------------------------------------------------
CREATE TABLE `tabWebsite Theme Ignore App` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `app` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkflow`
-- --------------------------------------------------------
CREATE TABLE `tabWorkflow` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `workflow_name` varchar(140) DEFAULT NULL,
  `document_type` varchar(140) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT 0,
  `override_status` int(1) NOT NULL DEFAULT 0,
  `send_email_alert` int(1) NOT NULL DEFAULT 0,
  `workflow_state_field` varchar(140) DEFAULT 'workflow_state',
  `workflow_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`workflow_data`)),
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `workflow_name` (`workflow_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkflow Action`
-- --------------------------------------------------------
CREATE TABLE `tabWorkflow Action` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `status` varchar(140) DEFAULT NULL,
  `reference_name` varchar(140) DEFAULT NULL,
  `reference_doctype` varchar(140) DEFAULT NULL,
  `workflow_state` varchar(140) DEFAULT NULL,
  `completed_by_role` varchar(140) DEFAULT NULL,
  `completed_by` varchar(140) DEFAULT NULL,
  `user` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `user` (`user`),
  KEY `modified` (`modified`),
  KEY `reference_name_reference_doctype_status_index` (`reference_name`,`reference_doctype`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkflow Action Master`
-- --------------------------------------------------------
CREATE TABLE `tabWorkflow Action Master` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `workflow_action_name` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `workflow_action_name` (`workflow_action_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkflow Action Permitted Role`
-- --------------------------------------------------------
CREATE TABLE `tabWorkflow Action Permitted Role` (
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


-- --------------------------------------------------------
-- Table structure for `tabWorkflow Document State`
-- --------------------------------------------------------
CREATE TABLE `tabWorkflow Document State` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `state` varchar(140) DEFAULT NULL,
  `doc_status` varchar(140) DEFAULT '0',
  `update_field` varchar(140) DEFAULT NULL,
  `update_value` varchar(140) DEFAULT NULL,
  `is_optional_state` int(1) NOT NULL DEFAULT 0,
  `avoid_status_override` int(1) NOT NULL DEFAULT 0,
  `next_action_email_template` varchar(140) DEFAULT NULL,
  `allow_edit` varchar(140) DEFAULT NULL,
  `send_email` int(1) NOT NULL DEFAULT 1,
  `message` text DEFAULT NULL,
  `workflow_builder_id` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkflow State`
-- --------------------------------------------------------
CREATE TABLE `tabWorkflow State` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `workflow_state_name` varchar(140) DEFAULT NULL,
  `icon` varchar(140) DEFAULT NULL,
  `style` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `workflow_state_name` (`workflow_state_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkflow Transition`
-- --------------------------------------------------------
CREATE TABLE `tabWorkflow Transition` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `state` varchar(140) DEFAULT NULL,
  `action` varchar(140) DEFAULT NULL,
  `next_state` varchar(140) DEFAULT NULL,
  `allowed` varchar(140) DEFAULT NULL,
  `allow_self_approval` int(1) NOT NULL DEFAULT 1,
  `send_email_to_creator` int(1) NOT NULL DEFAULT 0,
  `condition` longtext DEFAULT NULL,
  `workflow_builder_id` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkspace`
-- --------------------------------------------------------
CREATE TABLE `tabWorkspace` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `label` varchar(140) DEFAULT NULL,
  `title` varchar(140) DEFAULT NULL,
  `sequence_id` decimal(21,9) NOT NULL DEFAULT 0.000000000,
  `for_user` varchar(140) DEFAULT NULL,
  `parent_page` varchar(140) DEFAULT NULL,
  `module` varchar(140) DEFAULT NULL,
  `icon` varchar(140) DEFAULT NULL,
  `indicator_color` varchar(140) DEFAULT NULL,
  `restrict_to_domain` varchar(140) DEFAULT NULL,
  `hide_custom` int(1) NOT NULL DEFAULT 0,
  `public` int(1) NOT NULL DEFAULT 0,
  `is_hidden` int(1) NOT NULL DEFAULT 0,
  `content` longtext DEFAULT '[]',
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `label` (`label`),
  KEY `restrict_to_domain` (`restrict_to_domain`),
  KEY `public` (`public`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkspace Chart`
-- --------------------------------------------------------
CREATE TABLE `tabWorkspace Chart` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `chart_name` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkspace Custom Block`
-- --------------------------------------------------------
CREATE TABLE `tabWorkspace Custom Block` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `custom_block_name` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkspace Link`
-- --------------------------------------------------------
CREATE TABLE `tabWorkspace Link` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT 'Link',
  `label` varchar(140) DEFAULT NULL,
  `icon` varchar(140) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `hidden` int(1) NOT NULL DEFAULT 0,
  `link_type` varchar(140) DEFAULT NULL,
  `link_to` varchar(140) DEFAULT NULL,
  `report_ref_doctype` varchar(140) DEFAULT NULL,
  `dependencies` varchar(140) DEFAULT NULL,
  `only_for` varchar(140) DEFAULT NULL,
  `onboard` int(1) NOT NULL DEFAULT 0,
  `is_query_report` int(1) NOT NULL DEFAULT 0,
  `link_count` int(11) NOT NULL DEFAULT 0,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkspace Number Card`
-- --------------------------------------------------------
CREATE TABLE `tabWorkspace Number Card` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `number_card_name` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkspace Quick List`
-- --------------------------------------------------------
CREATE TABLE `tabWorkspace Quick List` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `document_type` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `quick_list_filter` longtext DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------
-- Table structure for `tabWorkspace Shortcut`
-- --------------------------------------------------------
CREATE TABLE `tabWorkspace Shortcut` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `type` varchar(140) DEFAULT NULL,
  `link_to` varchar(140) DEFAULT NULL,
  `url` varchar(140) DEFAULT NULL,
  `doc_view` varchar(140) DEFAULT NULL,
  `kanban_board` varchar(140) DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `icon` varchar(140) DEFAULT NULL,
  `restrict_to_domain` varchar(140) DEFAULT NULL,
  `report_ref_doctype` varchar(140) DEFAULT NULL,
  `stats_filter` longtext DEFAULT NULL,
  `color` varchar(140) DEFAULT NULL,
  `format` varchar(140) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `parentfield` varchar(140) DEFAULT NULL,
  `parenttype` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


