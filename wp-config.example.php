<?php

define('FORCE_SSL_ADMIN', true);
define('WP_HOME', 'https://www.ronitascrafts.com' );
define('WP_SITEURL', 'https://www.ronitascrafts.com' );
define('.COOKIE_DOMAIN.', 'www.ronitascrafts.com');
define('.SITECOOKIEPATH.', '.');

$_SERVER['HTTP_HOST'] = 'www.ronitascrafts.com';
$_SERVER['REMOTE_ADDR'] = 'https://www.ronitascrafts.com';
$_SERVER['SERVER_ADDR'] = 'www.ronitascrafts.com';

if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $list = explode(',',$_SERVER['HTTP_X_FORWARDED_FOR']);
    $_SERVER['REMOTE_ADDR'] = $list[0];
}

if ($_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS']='on';
}
