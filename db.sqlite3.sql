BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `todo_todo` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`title`	varchar ( 100 ) NOT NULL,
	`description`	varchar ( 255 ) NOT NULL,
	`status`	varchar ( 5 ) NOT NULL,
	`updated`	datetime NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `accounts_user`(`id`)
);
CREATE TABLE IF NOT EXISTS `threads_thread` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 255 ) NOT NULL,
	`created_at`	datetime NOT NULL,
	`subject_id`	integer NOT NULL,
	`user_id`	integer NOT NULL,
	FOREIGN KEY(`subject_id`) REFERENCES `threads_subject`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `accounts_user`(`id`)
);
CREATE TABLE IF NOT EXISTS `threads_subject` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 255 ) NOT NULL,
	`description`	text NOT NULL
);
CREATE TABLE IF NOT EXISTS `threads_post` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`comment`	text NOT NULL,
	`created_at`	datetime NOT NULL,
	`thread_id`	integer NOT NULL,
	`user_id`	integer NOT NULL,
	FOREIGN KEY(`thread_id`) REFERENCES `threads_thread`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `accounts_user`(`id`)
);
CREATE TABLE IF NOT EXISTS `products_product` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 254 ) NOT NULL,
	`description`	text NOT NULL,
	`price`	decimal NOT NULL
);
CREATE TABLE IF NOT EXISTS `polls_vote` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`poll_id`	integer NOT NULL,
	`subject_id`	integer NOT NULL,
	`user_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `accounts_user`(`id`),
	FOREIGN KEY(`subject_id`) REFERENCES `polls_pollsubject`(`id`),
	FOREIGN KEY(`poll_id`) REFERENCES `polls_poll`(`id`)
);
CREATE TABLE IF NOT EXISTS `polls_pollsubject` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 255 ) NOT NULL,
	`poll_id`	integer NOT NULL,
	FOREIGN KEY(`poll_id`) REFERENCES `polls_poll`(`id`)
);
CREATE TABLE IF NOT EXISTS `polls_poll` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`question`	text NOT NULL,
	`thread_id`	integer UNIQUE,
	FOREIGN KEY(`thread_id`) REFERENCES `threads_thread`(`id`)
);
CREATE TABLE IF NOT EXISTS `paypal_ipn` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`business`	varchar ( 127 ) NOT NULL,
	`charset`	varchar ( 255 ) NOT NULL,
	`custom`	varchar ( 256 ) NOT NULL,
	`notify_version`	decimal,
	`parent_txn_id`	varchar ( 19 ) NOT NULL,
	`receiver_email`	varchar ( 254 ) NOT NULL,
	`receiver_id`	varchar ( 255 ) NOT NULL,
	`residence_country`	varchar ( 2 ) NOT NULL,
	`txn_id`	varchar ( 255 ) NOT NULL,
	`txn_type`	varchar ( 255 ) NOT NULL,
	`verify_sign`	varchar ( 255 ) NOT NULL,
	`address_country`	varchar ( 64 ) NOT NULL,
	`address_city`	varchar ( 40 ) NOT NULL,
	`address_country_code`	varchar ( 64 ) NOT NULL,
	`address_name`	varchar ( 128 ) NOT NULL,
	`address_state`	varchar ( 40 ) NOT NULL,
	`address_status`	varchar ( 255 ) NOT NULL,
	`address_street`	varchar ( 200 ) NOT NULL,
	`address_zip`	varchar ( 20 ) NOT NULL,
	`contact_phone`	varchar ( 20 ) NOT NULL,
	`first_name`	varchar ( 64 ) NOT NULL,
	`last_name`	varchar ( 64 ) NOT NULL,
	`payer_business_name`	varchar ( 127 ) NOT NULL,
	`payer_email`	varchar ( 127 ) NOT NULL,
	`payer_id`	varchar ( 13 ) NOT NULL,
	`auth_amount`	decimal,
	`auth_exp`	varchar ( 28 ) NOT NULL,
	`auth_id`	varchar ( 19 ) NOT NULL,
	`auth_status`	varchar ( 255 ) NOT NULL,
	`exchange_rate`	decimal,
	`invoice`	varchar ( 127 ) NOT NULL,
	`item_name`	varchar ( 127 ) NOT NULL,
	`item_number`	varchar ( 127 ) NOT NULL,
	`mc_currency`	varchar ( 32 ) NOT NULL,
	`mc_fee`	decimal,
	`mc_gross`	decimal,
	`mc_handling`	decimal,
	`mc_shipping`	decimal,
	`memo`	varchar ( 255 ) NOT NULL,
	`num_cart_items`	integer,
	`option_name1`	varchar ( 64 ) NOT NULL,
	`option_name2`	varchar ( 64 ) NOT NULL,
	`payer_status`	varchar ( 255 ) NOT NULL,
	`payment_date`	datetime,
	`payment_gross`	decimal,
	`payment_status`	varchar ( 255 ) NOT NULL,
	`payment_type`	varchar ( 255 ) NOT NULL,
	`pending_reason`	varchar ( 255 ) NOT NULL,
	`protection_eligibility`	varchar ( 255 ) NOT NULL,
	`quantity`	integer,
	`reason_code`	varchar ( 255 ) NOT NULL,
	`remaining_settle`	decimal,
	`settle_amount`	decimal,
	`settle_currency`	varchar ( 32 ) NOT NULL,
	`shipping`	decimal,
	`shipping_method`	varchar ( 255 ) NOT NULL,
	`tax`	decimal,
	`transaction_entity`	varchar ( 255 ) NOT NULL,
	`auction_buyer_id`	varchar ( 64 ) NOT NULL,
	`auction_closing_date`	datetime,
	`auction_multi_item`	integer,
	`for_auction`	decimal,
	`amount`	decimal,
	`amount_per_cycle`	decimal,
	`initial_payment_amount`	decimal,
	`next_payment_date`	datetime,
	`outstanding_balance`	decimal,
	`payment_cycle`	varchar ( 255 ) NOT NULL,
	`period_type`	varchar ( 255 ) NOT NULL,
	`product_name`	varchar ( 255 ) NOT NULL,
	`product_type`	varchar ( 255 ) NOT NULL,
	`profile_status`	varchar ( 255 ) NOT NULL,
	`recurring_payment_id`	varchar ( 255 ) NOT NULL,
	`rp_invoice_id`	varchar ( 127 ) NOT NULL,
	`time_created`	datetime,
	`amount1`	decimal,
	`amount2`	decimal,
	`amount3`	decimal,
	`mc_amount1`	decimal,
	`mc_amount2`	decimal,
	`mc_amount3`	decimal,
	`password`	varchar ( 24 ) NOT NULL,
	`period1`	varchar ( 255 ) NOT NULL,
	`period2`	varchar ( 255 ) NOT NULL,
	`period3`	varchar ( 255 ) NOT NULL,
	`reattempt`	varchar ( 1 ) NOT NULL,
	`recur_times`	integer,
	`recurring`	varchar ( 1 ) NOT NULL,
	`retry_at`	datetime,
	`subscr_date`	datetime,
	`subscr_effective`	datetime,
	`subscr_id`	varchar ( 19 ) NOT NULL,
	`username`	varchar ( 64 ) NOT NULL,
	`case_creation_date`	datetime,
	`case_id`	varchar ( 255 ) NOT NULL,
	`case_type`	varchar ( 255 ) NOT NULL,
	`receipt_id`	varchar ( 255 ) NOT NULL,
	`currency_code`	varchar ( 32 ) NOT NULL,
	`handling_amount`	decimal,
	`transaction_subject`	varchar ( 256 ) NOT NULL,
	`ipaddress`	char ( 39 ),
	`flag`	bool NOT NULL,
	`flag_code`	varchar ( 16 ) NOT NULL,
	`flag_info`	text NOT NULL,
	`query`	text NOT NULL,
	`response`	text NOT NULL,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	`from_view`	varchar ( 6 ),
	`mp_id`	varchar ( 128 ),
	`option_selection1`	varchar ( 200 ) NOT NULL,
	`option_selection2`	varchar ( 200 ) NOT NULL,
	`test_ipn`	bool NOT NULL
);
CREATE TABLE IF NOT EXISTS `magazines_purchase` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`subscription_end`	datetime NOT NULL,
	`magazine_id`	integer NOT NULL,
	`user_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `accounts_user`(`id`),
	FOREIGN KEY(`magazine_id`) REFERENCES `magazines_magazine`(`id`)
);
CREATE TABLE IF NOT EXISTS `magazines_magazine` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 254 ) NOT NULL,
	`description`	text NOT NULL,
	`price`	decimal NOT NULL
);
CREATE TABLE IF NOT EXISTS `django_site` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 50 ) NOT NULL,
	`domain`	varchar ( 100 ) NOT NULL UNIQUE
);
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
CREATE TABLE IF NOT EXISTS `django_session` (
	`session_key`	varchar ( 40 ) NOT NULL,
	`session_data`	text NOT NULL,
	`expire_date`	datetime NOT NULL,
	PRIMARY KEY(`session_key`)
);
INSERT INTO `django_session` VALUES ('otlw4k3m7uflyuo9vg7m5f6336s2q4az','MzkyNTkyMTAwN2YwYTljZDA3YTE2NjdkNTMxMWJlZTc3YTg3ZjZmYjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNDFiNGQxYTUyOGZjODY4Y2QwMjYzOTNkMDQ3YjIwYWRlNGE0YmI3In0=','2018-11-11 09:39:33.171261');
CREATE TABLE IF NOT EXISTS `django_migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app`	varchar ( 255 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	`applied`	datetime NOT NULL
);
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-27 11:00:48.414113');
INSERT INTO `django_migrations` VALUES (2,'contenttypes','0002_remove_content_type_name','2018-10-27 11:00:48.492235');
INSERT INTO `django_migrations` VALUES (3,'auth','0001_initial','2018-10-27 11:00:48.585982');
INSERT INTO `django_migrations` VALUES (4,'auth','0002_alter_permission_name_max_length','2018-10-27 11:00:48.664107');
INSERT INTO `django_migrations` VALUES (5,'auth','0003_alter_user_email_max_length','2018-10-27 11:00:48.710979');
INSERT INTO `django_migrations` VALUES (6,'auth','0004_alter_user_username_opts','2018-10-27 11:00:48.773478');
INSERT INTO `django_migrations` VALUES (7,'auth','0005_alter_user_last_login_null','2018-10-27 11:00:48.804727');
INSERT INTO `django_migrations` VALUES (8,'auth','0006_require_contenttypes_0002','2018-10-27 11:00:48.835977');
INSERT INTO `django_migrations` VALUES (9,'accounts','0001_initial','2018-10-27 11:00:48.914099');
INSERT INTO `django_migrations` VALUES (10,'admin','0001_initial','2018-10-27 11:00:48.992225');
INSERT INTO `django_migrations` VALUES (11,'sites','0001_initial','2018-10-27 11:00:49.054719');
INSERT INTO `django_migrations` VALUES (12,'flatpages','0001_initial','2018-10-27 11:00:49.148468');
INSERT INTO `django_migrations` VALUES (13,'ipn','0001_initial','2018-10-27 11:00:49.242213');
INSERT INTO `django_migrations` VALUES (14,'ipn','0002_paypalipn_mp_id','2018-10-27 11:00:49.554704');
INSERT INTO `django_migrations` VALUES (15,'ipn','0003_auto_20141117_1647','2018-10-27 11:00:49.898446');
INSERT INTO `django_migrations` VALUES (16,'ipn','0004_auto_20150612_1826','2018-10-27 11:00:53.406314');
INSERT INTO `django_migrations` VALUES (17,'ipn','0005_auto_20151217_0948','2018-10-27 11:00:53.656308');
INSERT INTO `django_migrations` VALUES (18,'ipn','0006_auto_20160108_1112','2018-10-27 11:00:53.890674');
INSERT INTO `django_migrations` VALUES (19,'ipn','0007_auto_20160219_1135','2018-10-27 11:00:54.125046');
INSERT INTO `django_migrations` VALUES (20,'magazines','0001_initial','2018-10-27 11:00:54.281290');
INSERT INTO `django_migrations` VALUES (21,'threads','0001_initial','2018-10-27 11:00:54.906271');
INSERT INTO `django_migrations` VALUES (22,'polls','0001_initial','2018-10-27 11:00:55.410821');
INSERT INTO `django_migrations` VALUES (23,'products','0001_initial','2018-10-27 11:00:55.525004');
INSERT INTO `django_migrations` VALUES (24,'sessions','0001_initial','2018-10-27 11:00:55.946867');
INSERT INTO `django_migrations` VALUES (25,'admin','0002_logentry_remove_auto_add','2018-10-28 09:40:12.831795');
INSERT INTO `django_migrations` VALUES (26,'admin','0003_logentry_add_action_flag_choices','2018-10-28 09:40:12.909920');
INSERT INTO `django_migrations` VALUES (27,'auth','0007_alter_validators_add_error_messages','2018-10-28 09:40:12.972418');
INSERT INTO `django_migrations` VALUES (28,'auth','0008_alter_user_username_max_length','2018-10-28 09:40:13.034915');
INSERT INTO `django_migrations` VALUES (29,'auth','0009_alter_user_last_name_max_length','2018-10-28 09:40:13.097412');
INSERT INTO `django_migrations` VALUES (30,'ipn','0008_auto_20181028_0940','2018-10-28 09:40:13.288476');
INSERT INTO `django_migrations` VALUES (31,'sites','0002_alter_domain_unique','2018-10-28 09:40:13.397849');
CREATE TABLE IF NOT EXISTS `django_flatpage_sites` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`flatpage_id`	integer NOT NULL,
	`site_id`	integer NOT NULL,
	FOREIGN KEY(`site_id`) REFERENCES `django_site`(`id`),
	UNIQUE(`flatpage_id`,`site_id`),
	FOREIGN KEY(`flatpage_id`) REFERENCES `django_flatpage`(`id`)
);
CREATE TABLE IF NOT EXISTS `django_flatpage` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`url`	varchar ( 100 ) NOT NULL,
	`title`	varchar ( 200 ) NOT NULL,
	`content`	text NOT NULL,
	`enable_comments`	bool NOT NULL,
	`template_name`	varchar ( 70 ) NOT NULL,
	`registration_required`	bool NOT NULL
);
CREATE TABLE IF NOT EXISTS `django_content_type` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app_label`	varchar ( 100 ) NOT NULL,
	`model`	varchar ( 100 ) NOT NULL,
	UNIQUE(`app_label`,`model`)
);
INSERT INTO `django_content_type` VALUES (1,'admin','logentry');
INSERT INTO `django_content_type` VALUES (2,'auth','permission');
INSERT INTO `django_content_type` VALUES (3,'auth','group');
INSERT INTO `django_content_type` VALUES (4,'contenttypes','contenttype');
INSERT INTO `django_content_type` VALUES (5,'sessions','session');
INSERT INTO `django_content_type` VALUES (6,'sites','site');
INSERT INTO `django_content_type` VALUES (7,'flatpages','flatpage');
INSERT INTO `django_content_type` VALUES (8,'accounts','user');
INSERT INTO `django_content_type` VALUES (9,'products','product');
INSERT INTO `django_content_type` VALUES (10,'magazines','magazine');
INSERT INTO `django_content_type` VALUES (11,'magazines','purchase');
INSERT INTO `django_content_type` VALUES (12,'threads','subject');
INSERT INTO `django_content_type` VALUES (13,'threads','thread');
INSERT INTO `django_content_type` VALUES (14,'threads','post');
INSERT INTO `django_content_type` VALUES (15,'polls','poll');
INSERT INTO `django_content_type` VALUES (16,'polls','pollsubject');
INSERT INTO `django_content_type` VALUES (17,'polls','vote');
INSERT INTO `django_content_type` VALUES (18,'ipn','paypalipn');
INSERT INTO `django_content_type` VALUES (19,'todo','todo');
CREATE TABLE IF NOT EXISTS `django_admin_log` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`action_time`	datetime NOT NULL,
	`object_id`	text,
	`object_repr`	varchar ( 200 ) NOT NULL,
	`change_message`	text NOT NULL,
	`content_type_id`	integer,
	`user_id`	integer NOT NULL,
	`action_flag`	smallint unsigned NOT NULL,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`user_id`) REFERENCES `accounts_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_permission` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`content_type_id`	integer NOT NULL,
	`codename`	varchar ( 100 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`),
	UNIQUE(`content_type_id`,`codename`)
);
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO `auth_permission` VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO `auth_permission` VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO `auth_permission` VALUES (4,2,'add_permission','Can add permission');
INSERT INTO `auth_permission` VALUES (5,2,'change_permission','Can change permission');
INSERT INTO `auth_permission` VALUES (6,2,'delete_permission','Can delete permission');
INSERT INTO `auth_permission` VALUES (7,3,'add_group','Can add group');
INSERT INTO `auth_permission` VALUES (8,3,'change_group','Can change group');
INSERT INTO `auth_permission` VALUES (9,3,'delete_group','Can delete group');
INSERT INTO `auth_permission` VALUES (10,4,'add_contenttype','Can add content type');
INSERT INTO `auth_permission` VALUES (11,4,'change_contenttype','Can change content type');
INSERT INTO `auth_permission` VALUES (12,4,'delete_contenttype','Can delete content type');
INSERT INTO `auth_permission` VALUES (13,5,'add_session','Can add session');
INSERT INTO `auth_permission` VALUES (14,5,'change_session','Can change session');
INSERT INTO `auth_permission` VALUES (15,5,'delete_session','Can delete session');
INSERT INTO `auth_permission` VALUES (16,6,'add_site','Can add site');
INSERT INTO `auth_permission` VALUES (17,6,'change_site','Can change site');
INSERT INTO `auth_permission` VALUES (18,6,'delete_site','Can delete site');
INSERT INTO `auth_permission` VALUES (19,7,'add_flatpage','Can add flat page');
INSERT INTO `auth_permission` VALUES (20,7,'change_flatpage','Can change flat page');
INSERT INTO `auth_permission` VALUES (21,7,'delete_flatpage','Can delete flat page');
INSERT INTO `auth_permission` VALUES (22,8,'add_user','Can add user');
INSERT INTO `auth_permission` VALUES (23,8,'change_user','Can change user');
INSERT INTO `auth_permission` VALUES (24,8,'delete_user','Can delete user');
INSERT INTO `auth_permission` VALUES (25,9,'add_product','Can add product');
INSERT INTO `auth_permission` VALUES (26,9,'change_product','Can change product');
INSERT INTO `auth_permission` VALUES (27,9,'delete_product','Can delete product');
INSERT INTO `auth_permission` VALUES (28,10,'add_magazine','Can add magazine');
INSERT INTO `auth_permission` VALUES (29,10,'change_magazine','Can change magazine');
INSERT INTO `auth_permission` VALUES (30,10,'delete_magazine','Can delete magazine');
INSERT INTO `auth_permission` VALUES (31,11,'add_purchase','Can add purchase');
INSERT INTO `auth_permission` VALUES (32,11,'change_purchase','Can change purchase');
INSERT INTO `auth_permission` VALUES (33,11,'delete_purchase','Can delete purchase');
INSERT INTO `auth_permission` VALUES (34,12,'add_subject','Can add subject');
INSERT INTO `auth_permission` VALUES (35,12,'change_subject','Can change subject');
INSERT INTO `auth_permission` VALUES (36,12,'delete_subject','Can delete subject');
INSERT INTO `auth_permission` VALUES (37,13,'add_thread','Can add thread');
INSERT INTO `auth_permission` VALUES (38,13,'change_thread','Can change thread');
INSERT INTO `auth_permission` VALUES (39,13,'delete_thread','Can delete thread');
INSERT INTO `auth_permission` VALUES (40,14,'add_post','Can add post');
INSERT INTO `auth_permission` VALUES (41,14,'change_post','Can change post');
INSERT INTO `auth_permission` VALUES (42,14,'delete_post','Can delete post');
INSERT INTO `auth_permission` VALUES (43,15,'add_poll','Can add poll');
INSERT INTO `auth_permission` VALUES (44,15,'change_poll','Can change poll');
INSERT INTO `auth_permission` VALUES (45,15,'delete_poll','Can delete poll');
INSERT INTO `auth_permission` VALUES (46,16,'add_pollsubject','Can add poll subject');
INSERT INTO `auth_permission` VALUES (47,16,'change_pollsubject','Can change poll subject');
INSERT INTO `auth_permission` VALUES (48,16,'delete_pollsubject','Can delete poll subject');
INSERT INTO `auth_permission` VALUES (49,17,'add_vote','Can add vote');
INSERT INTO `auth_permission` VALUES (50,17,'change_vote','Can change vote');
INSERT INTO `auth_permission` VALUES (51,17,'delete_vote','Can delete vote');
INSERT INTO `auth_permission` VALUES (52,18,'add_paypalipn','Can add PayPal IPN');
INSERT INTO `auth_permission` VALUES (53,18,'change_paypalipn','Can change PayPal IPN');
INSERT INTO `auth_permission` VALUES (54,18,'delete_paypalipn','Can delete PayPal IPN');
INSERT INTO `auth_permission` VALUES (55,19,'add_todo','Can add todo');
INSERT INTO `auth_permission` VALUES (56,19,'change_todo','Can change todo');
INSERT INTO `auth_permission` VALUES (57,19,'delete_todo','Can delete todo');
INSERT INTO `auth_permission` VALUES (58,1,'view_logentry','Can view log entry');
INSERT INTO `auth_permission` VALUES (59,2,'view_permission','Can view permission');
INSERT INTO `auth_permission` VALUES (60,3,'view_group','Can view group');
INSERT INTO `auth_permission` VALUES (61,4,'view_contenttype','Can view content type');
INSERT INTO `auth_permission` VALUES (62,5,'view_session','Can view session');
INSERT INTO `auth_permission` VALUES (63,6,'view_site','Can view site');
INSERT INTO `auth_permission` VALUES (64,7,'view_flatpage','Can view flat page');
INSERT INTO `auth_permission` VALUES (65,8,'view_user','Can view user');
INSERT INTO `auth_permission` VALUES (66,9,'view_product','Can view product');
INSERT INTO `auth_permission` VALUES (67,10,'view_magazine','Can view magazine');
INSERT INTO `auth_permission` VALUES (68,11,'view_purchase','Can view purchase');
INSERT INTO `auth_permission` VALUES (69,14,'view_post','Can view post');
INSERT INTO `auth_permission` VALUES (70,12,'view_subject','Can view subject');
INSERT INTO `auth_permission` VALUES (71,13,'view_thread','Can view thread');
INSERT INTO `auth_permission` VALUES (72,15,'view_poll','Can view poll');
INSERT INTO `auth_permission` VALUES (73,16,'view_pollsubject','Can view poll subject');
INSERT INTO `auth_permission` VALUES (74,17,'view_vote','Can view vote');
INSERT INTO `auth_permission` VALUES (75,18,'view_paypalipn','Can view PayPal IPN');
INSERT INTO `auth_permission` VALUES (76,19,'view_todo','Can view todo');
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`group_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`),
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`),
	UNIQUE(`group_id`,`permission_id`)
);
CREATE TABLE IF NOT EXISTS `auth_group` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 80 ) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS `accounts_user_user_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `accounts_user`(`id`),
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`),
	UNIQUE(`user_id`,`permission_id`)
);
CREATE TABLE IF NOT EXISTS `accounts_user_groups` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`group_id`	integer NOT NULL,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `accounts_user`(`id`),
	UNIQUE(`user_id`,`group_id`)
);
CREATE TABLE IF NOT EXISTS `accounts_user` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`password`	varchar ( 128 ) NOT NULL,
	`last_login`	datetime,
	`is_superuser`	bool NOT NULL,
	`username`	varchar ( 30 ) NOT NULL UNIQUE,
	`first_name`	varchar ( 30 ) NOT NULL,
	`last_name`	varchar ( 30 ) NOT NULL,
	`email`	varchar ( 254 ) NOT NULL,
	`is_staff`	bool NOT NULL,
	`is_active`	bool NOT NULL,
	`date_joined`	datetime NOT NULL,
	`stripe_id`	varchar ( 40 ) NOT NULL,
	`subscription_end`	varchar ( 40 ) NOT NULL
);
INSERT INTO `accounts_user` VALUES (3,'pbkdf2_sha256$120000$Sp96HEvNSYa9$pqCJtjj4OiC/NixA+5xfxBPAbcQ9ZsyS/AKo+9Zx4Z4=','2018-10-28 09:39:33.148278',1,'rickharrisit@gmx.com','','','rickharrisit@gmx.com',1,1,'2018-10-28 09:38:19.151546','','');
CREATE INDEX IF NOT EXISTS `todo_todo_e8701ad4` ON `todo_todo` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `threads_thread_ffaba1d1` ON `threads_thread` (
	`subject_id`
);
CREATE INDEX IF NOT EXISTS `threads_thread_e8701ad4` ON `threads_thread` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `threads_post_e8701ad4` ON `threads_post` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `threads_post_e3464c97` ON `threads_post` (
	`thread_id`
);
CREATE INDEX IF NOT EXISTS `polls_vote_ffaba1d1` ON `polls_vote` (
	`subject_id`
);
CREATE INDEX IF NOT EXISTS `polls_vote_e8701ad4` ON `polls_vote` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `polls_vote_582e9e5a` ON `polls_vote` (
	`poll_id`
);
CREATE INDEX IF NOT EXISTS `polls_pollsubject_582e9e5a` ON `polls_pollsubject` (
	`poll_id`
);
CREATE INDEX IF NOT EXISTS `paypal_ipn_txn_id_8fa22c44` ON `paypal_ipn` (
	`txn_id`
);
CREATE INDEX IF NOT EXISTS `magazines_purchase_e8701ad4` ON `magazines_purchase` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `magazines_purchase_356d5114` ON `magazines_purchase` (
	`magazine_id`
);
CREATE INDEX IF NOT EXISTS `django_session_de54fa62` ON `django_session` (
	`expire_date`
);
CREATE INDEX IF NOT EXISTS `django_flatpage_sites_c3368d3a` ON `django_flatpage_sites` (
	`flatpage_id`
);
CREATE INDEX IF NOT EXISTS `django_flatpage_sites_9365d6e7` ON `django_flatpage_sites` (
	`site_id`
);
CREATE INDEX IF NOT EXISTS `django_flatpage_572d4e42` ON `django_flatpage` (
	`url`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_user_id_c564eba6` ON `django_admin_log` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_content_type_id_c4bce8eb` ON `django_admin_log` (
	`content_type_id`
);
CREATE INDEX IF NOT EXISTS `auth_permission_417f1b1c` ON `auth_permission` (
	`content_type_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_8373b171` ON `auth_group_permissions` (
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_0e939a4f` ON `auth_group_permissions` (
	`group_id`
);
CREATE INDEX IF NOT EXISTS `accounts_user_user_permissions_e8701ad4` ON `accounts_user_user_permissions` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `accounts_user_user_permissions_8373b171` ON `accounts_user_user_permissions` (
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `accounts_user_groups_e8701ad4` ON `accounts_user_groups` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `accounts_user_groups_0e939a4f` ON `accounts_user_groups` (
	`group_id`
);
COMMIT;
