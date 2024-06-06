-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 10, 2023 lúc 01:42 PM
-- Phiên bản máy phục vụ: 10.3.38-MariaDB-cll-lve
-- Phiên bản PHP: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `con66544_ccbd`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_alertlog`
--

CREATE TABLE `app_alertlog` (
  `id` int(11) NOT NULL,
  `contactid` int(11) NOT NULL,
  `contactname` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobilenumber` varchar(255) NOT NULL,
  `pushbullet` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `pushover` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_checks`
--

CREATE TABLE `app_checks` (
  `id` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `common` varchar(12) NOT NULL,
  `type` varchar(12) NOT NULL,
  `port` varchar(12) NOT NULL,
  `timeout` int(11) NOT NULL,
  `host` varchar(512) NOT NULL,
  `send` text NOT NULL,
  `expect` text NOT NULL,
  `status` int(1) NOT NULL,
  `geodata` text NOT NULL,
  `on_map` int(1) NOT NULL,
  `lat` varchar(32) NOT NULL,
  `lng` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_checks`
--

INSERT INTO `app_checks` (`id`, `groupid`, `name`, `common`, `type`, `port`, `timeout`, `host`, `send`, `expect`, `status`, `geodata`, `on_map`, `lat`, `lng`) VALUES
(1, 1, 'Google Public DNS Server', 'tcp', 'tcp', '53', 5, '8.8.8.8', '', '', 0, '', 0, '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_checks_alerts`
--

CREATE TABLE `app_checks_alerts` (
  `id` int(11) NOT NULL,
  `checkid` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `comparison` varchar(25) NOT NULL,
  `comparison_limit` varchar(100) NOT NULL,
  `occurrences` int(10) NOT NULL DEFAULT 1,
  `contacts` text NOT NULL,
  `repeats` int(5) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_checks_alerts`
--

INSERT INTO `app_checks_alerts` (`id`, `checkid`, `type`, `comparison`, `comparison_limit`, `occurrences`, `contacts`, `repeats`, `status`) VALUES
(1, 1, 'offline', '==', '', 2, 'a:1:{i:0;s:1:\"1\";}', 0, 1),
(2, 1, 'responsetime', '>=', '700', 2, 'a:1:{i:0;s:1:\"1\";}', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_checks_history`
--

CREATE TABLE `app_checks_history` (
  `id` int(11) NOT NULL,
  `checkid` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `latency` varchar(10) NOT NULL,
  `statuscode` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_checks_incidents`
--

CREATE TABLE `app_checks_incidents` (
  `id` int(11) NOT NULL,
  `checkid` int(11) NOT NULL,
  `alertid` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `comparison` varchar(25) NOT NULL,
  `comparison_limit` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `repeats` int(5) NOT NULL DEFAULT 0,
  `last_notification` datetime NOT NULL,
  `comment` text NOT NULL,
  `ignore` tinyint(1) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_contacts`
--

CREATE TABLE `app_contacts` (
  `id` int(11) NOT NULL,
  `groupid` int(11) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobilenumber` varchar(255) NOT NULL,
  `pushbullet` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `pushover` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_contacts`
--

INSERT INTO `app_contacts` (`id`, `groupid`, `status`, `name`, `email`, `mobilenumber`, `pushbullet`, `twitter`, `pushover`) VALUES
(1, 1, 1, 'ShopCodeWeb', 'shopcodeweb.com@gmail.com', '', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_dnsbls`
--

CREATE TABLE `app_dnsbls` (
  `id` int(11) NOT NULL,
  `host` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_dnsbls`
--

INSERT INTO `app_dnsbls` (`id`, `host`) VALUES
(11, 'b.barracudacentral.org'),
(7, 'bl.spamcop.net'),
(12, 'cbl.abuseat.org'),
(1, 'dnsbl-1.uceprotect.net'),
(2, 'dnsbl-2.uceprotect.net'),
(3, 'dnsbl-3.uceprotect.net'),
(4, 'dnsbl.dronebl.org'),
(5, 'dnsbl.sorbs.net'),
(10, 'pbl.spamhaus.org'),
(8, 'sbl.spamhaus.org'),
(13, 'spam.abuse.ch'),
(14, 'spam.spamrats.com'),
(9, 'xbl.spamhaus.org'),
(6, 'zen.spamhaus.org');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_groups`
--

CREATE TABLE `app_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_groups`
--

INSERT INTO `app_groups` (`id`, `name`) VALUES
(1, 'Main Group');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_pages`
--

CREATE TABLE `app_pages` (
  `id` int(11) NOT NULL,
  `groupid` int(11) NOT NULL DEFAULT 0,
  `pagekey` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `servers` text NOT NULL,
  `websites` text NOT NULL,
  `checks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_servers`
--

CREATE TABLE `app_servers` (
  `id` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serverkey` varchar(64) NOT NULL,
  `status` int(1) NOT NULL,
  `geodata` text NOT NULL,
  `on_map` int(1) NOT NULL,
  `lat` varchar(32) NOT NULL,
  `lng` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_servers_alerts`
--

CREATE TABLE `app_servers_alerts` (
  `id` int(11) NOT NULL,
  `serverid` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `comparison` varchar(25) NOT NULL,
  `comparison_limit` varchar(100) NOT NULL,
  `occurrences` int(10) NOT NULL,
  `contacts` text NOT NULL,
  `repeats` int(5) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_servers_history`
--

CREATE TABLE `app_servers_history` (
  `id` int(11) NOT NULL,
  `serverid` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_servers_incidents`
--

CREATE TABLE `app_servers_incidents` (
  `id` int(11) NOT NULL,
  `serverid` int(11) NOT NULL,
  `alertid` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `comparison` varchar(25) NOT NULL,
  `comparison_limit` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `repeats` int(5) NOT NULL DEFAULT 0,
  `last_notification` datetime NOT NULL,
  `comment` text NOT NULL,
  `ignore` tinyint(1) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_websites`
--

CREATE TABLE `app_websites` (
  `id` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `expect` text NOT NULL,
  `timeout` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `geodata` text NOT NULL,
  `on_map` int(1) NOT NULL,
  `lat` varchar(32) NOT NULL,
  `lng` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_websites`
--

INSERT INTO `app_websites` (`id`, `groupid`, `name`, `url`, `expect`, `timeout`, `status`, `geodata`, `on_map`, `lat`, `lng`) VALUES
(1, 1, 'Google', 'https://www.google.com', '', 0, 0, '', 0, '', ''),
(2, 1, 'CodeCanyon', 'https://codecanyon.net/', '', 0, 0, '', 0, '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_websites_alerts`
--

CREATE TABLE `app_websites_alerts` (
  `id` int(11) NOT NULL,
  `websiteid` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `comparison` varchar(25) NOT NULL,
  `comparison_limit` varchar(100) NOT NULL,
  `occurrences` int(10) NOT NULL,
  `contacts` text NOT NULL,
  `repeats` int(5) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `app_websites_alerts`
--

INSERT INTO `app_websites_alerts` (`id`, `websiteid`, `type`, `comparison`, `comparison_limit`, `occurrences`, `contacts`, `repeats`, `status`) VALUES
(1, 0, 'responsecode', '!=', '200', 2, 'a:1:{i:0;s:1:\"1\";}', 0, 1),
(2, 0, 'loadtime', '>=', '5', 2, 'a:1:{i:0;s:1:\"1\";}', 0, 1),
(3, 1, 'responsecode', '!=', '200', 2, 'a:1:{i:0;s:1:\"1\";}', 0, 1),
(4, 1, 'loadtime', '>=', '5', 2, 'a:1:{i:0;s:1:\"1\";}', 0, 1),
(5, 2, 'responsecode', '!=', '200', 2, 'a:1:{i:0;s:1:\"1\";}', 0, 1),
(6, 2, 'loadtime', '>=', '5', 2, 'a:1:{i:0;s:1:\"1\";}', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_websites_history`
--

CREATE TABLE `app_websites_history` (
  `id` int(11) NOT NULL,
  `websiteid` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `latency` varchar(10) NOT NULL,
  `statuscode` varchar(10) NOT NULL,
  `has_expected` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_websites_incidents`
--

CREATE TABLE `app_websites_incidents` (
  `id` int(11) NOT NULL,
  `websiteid` int(11) NOT NULL,
  `alertid` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `comparison` varchar(25) NOT NULL,
  `comparison_limit` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `repeats` int(5) NOT NULL DEFAULT 0,
  `last_notification` datetime NOT NULL,
  `comment` text NOT NULL,
  `ignore` tinyint(1) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_activitylog`
--

CREATE TABLE `core_activitylog` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `core_activitylog`
--

INSERT INTO `core_activitylog` (`id`, `userid`, `ipaddress`, `description`, `timestamp`) VALUES
(1, -1, '113.171.153.144', 'User Logged In - ID: 1', '2023-07-10 04:32:23'),
(2, 1, '113.171.153.144', 'Language Added - ID: 2', '2023-07-10 04:32:40'),
(3, 1, '113.171.153.144', 'Profile Edited - ID: 1', '2023-07-10 04:34:09'),
(4, 1, '113.171.153.144', 'Profile Edited - ID: 1', '2023-07-10 04:40:07'),
(5, 1, '113.171.153.144', 'Profile Edited - ID: 1', '2023-07-10 04:40:07'),
(6, 1, '113.171.153.144', 'Profile Edited - ID: 1', '2023-07-10 13:36:19'),
(7, 1, '113.171.153.144', 'User Signned Out - ID: 1', '2023-07-10 13:37:36'),
(8, -1, '113.171.153.144', 'User Logged In - ID: 1', '2023-07-10 13:37:44'),
(9, -1, '113.171.153.144', 'User Logged In - ID: 1', '2023-07-10 13:40:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_config`
--

CREATE TABLE `core_config` (
  `name` varchar(128) NOT NULL,
  `value` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `core_config`
--

INSERT INTO `core_config` (`name`, `value`) VALUES
('app_name', '<b>n</b>Mon'),
('app_url', 'https://congchungbinhduong.net/'),
('check_timeout', '5'),
('company_details', ''),
('company_name', 'nMon Company'),
('date_format', 'd/m/Y;dd/mm/yyyy'),
('db_version', '1.12'),
('default_contacts', 'a:1:{i:0;s:1:\"1\";}'),
('default_lang', 'vi'),
('email_from_address', 'nmon@example.com'),
('email_from_name', 'nMon'),
('email_smtp_auth', 'false'),
('email_smtp_domain', ''),
('email_smtp_enable', 'false'),
('email_smtp_host', ''),
('email_smtp_password', ''),
('email_smtp_port', ''),
('email_smtp_security', ''),
('email_smtp_username', ''),
('google_maps_api_key', ''),
('history_retention', '90'),
('log_retention', '90'),
('pushover_apitoken', ''),
('sms_api_id', ''),
('sms_from', ''),
('sms_password', ''),
('sms_provider', 'clickatell'),
('sms_user', ''),
('table_records', '50'),
('timezone', 'Asia/Bangkok'),
('twitter_apikey', ''),
('twitter_apisecret', ''),
('twitter_token', ''),
('twitter_tokensecret', ''),
('website_timeout', '100'),
('week_start', '1'),
('xss_filtering', 'true');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_cronlog`
--

CREATE TABLE `core_cronlog` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `data` text NOT NULL,
  `execution_time` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_emaillog`
--

CREATE TABLE `core_emaillog` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `to` varchar(128) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_files`
--

CREATE TABLE `core_files` (
  `id` int(11) NOT NULL,
  `equipmentid` int(11) NOT NULL,
  `vehicleid` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_languages`
--

CREATE TABLE `core_languages` (
  `id` int(11) NOT NULL,
  `code` varchar(4) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `core_languages`
--

INSERT INTO `core_languages` (`id`, `code`, `name`) VALUES
(1, 'en', 'English (System)'),
(2, 'vi', 'Vietnam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_notifications`
--

CREATE TABLE `core_notifications` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `core_notifications`
--

INSERT INTO `core_notifications` (`id`, `name`, `subject`, `message`, `info`) VALUES
(1, 'New User', 'New User', '<p>Hello {contact},<br><br>Your account has been successfully created.</p><p><br>Email Address: {email}<br>Password: {password}<br><br><br>Best regards,<br>{company}<br></p>', ''),
(2, 'Password Reset', 'Password Reset', '<p>Hello {contact},<br><br>Please follow the link below to reset your password.<br>{resetlink}<br><br>Best regards,<br>{company}<br></p>', ''),
(3, 'nMon Incident Alert', '{subject}', '<p>Hello {contact},</p><p><b>{message}</b></p><p><br>Best regards,<br>{company}<br></p>', ''),
(4, 'nMon Incident Unresolved', '{subject}', '<p>Hello {contact},</p><p><b>{message}</b></p><p><br>Best regards,<br>{company}<br></p>', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_roles`
--

CREATE TABLE `core_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `perms` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `core_roles`
--

INSERT INTO `core_roles` (`id`, `name`, `perms`) VALUES
(1, 'Super Administrator', 'a:38:{i:0;s:9:\"addServer\";i:1;s:10:\"editServer\";i:2;s:12:\"deleteServer\";i:3;s:11:\"viewServers\";i:4;s:10:\"addWebsite\";i:5;s:11:\"editWebsite\";i:6;s:13:\"deleteWebsite\";i:7;s:12:\"viewWebsites\";i:8;s:8:\"addCheck\";i:9;s:9:\"editCheck\";i:10;s:11:\"deleteCheck\";i:11;s:10:\"viewChecks\";i:12;s:10:\"addContact\";i:13;s:11:\"editContact\";i:14;s:13:\"deleteContact\";i:15;s:12:\"viewContacts\";i:16;s:8:\"addGroup\";i:17;s:9:\"editGroup\";i:18;s:11:\"deleteGroup\";i:19;s:10:\"viewGroups\";i:20;s:7:\"addPage\";i:21;s:8:\"editPage\";i:22;s:10:\"deletePage\";i:23;s:9:\"viewPages\";i:24;s:7:\"addUser\";i:25;s:8:\"editUser\";i:26;s:10:\"deleteUser\";i:27;s:9:\"viewUsers\";i:28;s:7:\"addRole\";i:29;s:8:\"editRole\";i:30;s:10:\"deleteRole\";i:31;s:9:\"viewRoles\";i:32;s:14:\"manageSettings\";i:33;s:8:\"viewLogs\";i:34;s:13:\"viewAlertLogs\";i:35;s:10:\"viewSystem\";i:36;s:6:\"search\";i:37;s:4:\"Null\";}'),
(2, 'Operator', 'a:20:{i:0;s:9:\"addServer\";i:1;s:11:\"viewServers\";i:2;s:10:\"addWebsite\";i:3;s:12:\"viewWebsites\";i:4;s:8:\"addCheck\";i:5;s:10:\"viewChecks\";i:6;s:10:\"addContact\";i:7;s:12:\"viewContacts\";i:8;s:8:\"addGroup\";i:9;s:10:\"viewGroups\";i:10;s:7:\"addPage\";i:11;s:9:\"viewPages\";i:12;s:7:\"addUser\";i:13;s:9:\"viewUsers\";i:14;s:9:\"viewRoles\";i:15;s:8:\"viewLogs\";i:16;s:13:\"viewAlertLogs\";i:17;s:10:\"viewSystem\";i:18;s:6:\"search\";i:19;s:4:\"Null\";}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_smslog`
--

CREATE TABLE `core_smslog` (
  `id` int(11) NOT NULL,
  `to` varchar(128) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_statuses`
--

CREATE TABLE `core_statuses` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `core_statuses`
--

INSERT INTO `core_statuses` (`id`, `code`, `type`, `message`) VALUES
(45, 10, 'success', 'Item has been added successfully!'),
(46, 20, 'success', 'Item has been saved successfully!'),
(47, 30, 'success', 'Item has been deleted successfully!'),
(48, 11, 'danger', 'Error! Cannot add item.'),
(49, 21, 'danger', 'Error! Cannot save item.'),
(50, 31, 'danger', 'Error! Cannot delete item.'),
(51, 40, 'success', 'Settings updated successfully!'),
(52, 1200, 'danger', 'Authentication Failed!'),
(53, 1300, 'success', 'Please check your email for a password reset link.'),
(54, 1400, 'danger', 'Email address was not found.'),
(55, 1500, 'danger', 'Invalid reset key!'),
(56, 1600, 'success', 'Success. Please log in with your new password! '),
(57, 1, 'danger', 'Unauthorized Access'),
(58, 50, 'warning', 'Disabled in demo mode!');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `core_users`
--

CREATE TABLE `core_users` (
  `id` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `groups` text NOT NULL,
  `theme` varchar(64) NOT NULL,
  `sidebar` varchar(64) NOT NULL,
  `layout` varchar(64) NOT NULL,
  `notes` text NOT NULL,
  `sessionid` varchar(255) NOT NULL,
  `resetkey` varchar(255) NOT NULL,
  `lang` varchar(2) NOT NULL,
  `avatar` mediumblob NOT NULL,
  `autorefresh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `core_users`
--

INSERT INTO `core_users` (`id`, `roleid`, `name`, `email`, `password`, `groups`, `theme`, `sidebar`, `layout`, `notes`, `sessionid`, `resetkey`, `lang`, `avatar`, `autorefresh`) VALUES
(1, 1, 'ShopCodeWeb', 'shopcodeweb.com@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'a:1:{i:0;s:1:\"0\";}', 'skin-green', 'opened', '', '', 'e655qm9skqi1ca3qpap4492r7q', '', 'vi', '', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `app_alertlog`
--
ALTER TABLE `app_alertlog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `app_checks`
--
ALTER TABLE `app_checks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `app_checks_alerts`
--
ALTER TABLE `app_checks_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkid` (`checkid`);

--
-- Chỉ mục cho bảng `app_checks_history`
--
ALTER TABLE `app_checks_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkid` (`checkid`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Chỉ mục cho bảng `app_checks_incidents`
--
ALTER TABLE `app_checks_incidents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serverid` (`checkid`);

--
-- Chỉ mục cho bảng `app_contacts`
--
ALTER TABLE `app_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `app_dnsbls`
--
ALTER TABLE `app_dnsbls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `host` (`host`);

--
-- Chỉ mục cho bảng `app_groups`
--
ALTER TABLE `app_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `app_pages`
--
ALTER TABLE `app_pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `app_servers`
--
ALTER TABLE `app_servers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serverkey` (`serverkey`);

--
-- Chỉ mục cho bảng `app_servers_alerts`
--
ALTER TABLE `app_servers_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serverid` (`serverid`);

--
-- Chỉ mục cho bảng `app_servers_history`
--
ALTER TABLE `app_servers_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serverid` (`serverid`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Chỉ mục cho bảng `app_servers_incidents`
--
ALTER TABLE `app_servers_incidents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serverid` (`serverid`);

--
-- Chỉ mục cho bảng `app_websites`
--
ALTER TABLE `app_websites`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `app_websites_alerts`
--
ALTER TABLE `app_websites_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `websiteid` (`websiteid`);

--
-- Chỉ mục cho bảng `app_websites_history`
--
ALTER TABLE `app_websites_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `websiteid` (`websiteid`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Chỉ mục cho bảng `app_websites_incidents`
--
ALTER TABLE `app_websites_incidents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serverid` (`websiteid`);

--
-- Chỉ mục cho bảng `core_activitylog`
--
ALTER TABLE `core_activitylog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `core_config`
--
ALTER TABLE `core_config`
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `core_cronlog`
--
ALTER TABLE `core_cronlog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `core_emaillog`
--
ALTER TABLE `core_emaillog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Chỉ mục cho bảng `core_files`
--
ALTER TABLE `core_files`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `core_languages`
--
ALTER TABLE `core_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `core_notifications`
--
ALTER TABLE `core_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `core_roles`
--
ALTER TABLE `core_roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `core_smslog`
--
ALTER TABLE `core_smslog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Chỉ mục cho bảng `core_statuses`
--
ALTER TABLE `core_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `core_users`
--
ALTER TABLE `core_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `app_alertlog`
--
ALTER TABLE `app_alertlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `app_checks`
--
ALTER TABLE `app_checks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `app_checks_alerts`
--
ALTER TABLE `app_checks_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `app_checks_history`
--
ALTER TABLE `app_checks_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `app_checks_incidents`
--
ALTER TABLE `app_checks_incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `app_contacts`
--
ALTER TABLE `app_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `app_dnsbls`
--
ALTER TABLE `app_dnsbls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `app_groups`
--
ALTER TABLE `app_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `app_pages`
--
ALTER TABLE `app_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `app_servers`
--
ALTER TABLE `app_servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `app_servers_alerts`
--
ALTER TABLE `app_servers_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `app_servers_history`
--
ALTER TABLE `app_servers_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `app_servers_incidents`
--
ALTER TABLE `app_servers_incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `app_websites`
--
ALTER TABLE `app_websites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `app_websites_alerts`
--
ALTER TABLE `app_websites_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `app_websites_history`
--
ALTER TABLE `app_websites_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `app_websites_incidents`
--
ALTER TABLE `app_websites_incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `core_activitylog`
--
ALTER TABLE `core_activitylog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `core_cronlog`
--
ALTER TABLE `core_cronlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `core_emaillog`
--
ALTER TABLE `core_emaillog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `core_files`
--
ALTER TABLE `core_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `core_languages`
--
ALTER TABLE `core_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `core_notifications`
--
ALTER TABLE `core_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `core_roles`
--
ALTER TABLE `core_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `core_smslog`
--
ALTER TABLE `core_smslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `core_statuses`
--
ALTER TABLE `core_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `core_users`
--
ALTER TABLE `core_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
