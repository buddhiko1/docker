<?php
$CONFIG = array (
  'force_language' => 'zh_CN',
  "force_locale" => "zh_CN",
  'htaccess.RewriteBase' => '/',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'memcache.distributed' => '\\OC\\Memcache\\Redis',
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'redis' => 
  array (
    'host' => 'redis',
    'password' => '',
    'port' => 6379,
  ),
  'overwriteprotocol' => 'https',
  'overwrite.cli.url' => 'https://cloud.fuyouindustries.com',
  'upgrade.disable-web' => true,
  'instanceid' => 'ocgmiy4m64fm',
  'passwordsalt' => 'AtZ7LghmC8mEWccSQeh9WbyID4w0Lt',
  'secret' => 'bggGUfYLoyzRgguMmCS/2c7ldIYbHA2nQNKDjXD5OzNZX/Tm',
  'trusted_domains' => 
  array (
    0 => 'cloud.fuyouindustries.com',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'sqlite3',
  'version' => '30.0.2.2',
  'dbname' => 'cloud',
  'installed' => true,
  'mail_smtpmode' => 'smtp',
  'mail_smtpsecure' => 'ssl',
  'mail_sendmailmode' => 'smtp',
  'mail_smtphost' => 'smtphz.qiye.163.com',
  'mail_smtpport' => '465',
  'mail_smtpauth' => 1,
  'mail_from_address' => 'purchase',
  'mail_domain' => 'dxtableware.com',
  'mail_smtpname' => 'purchase@dxtableware.com',
  'mail_smtppassword' => 'Dx@200483',
);
