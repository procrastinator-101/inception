<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress_owner' );

/** MySQL database password */
define( 'DB_PASSWORD', 'OwnerPassword' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         '1j$WyZ/[-IK#h,ylrmp(A|R[O5=8F6}#+nm7OM$;m*(u@?{Cv+p5n<%2k$?</H8g');
define('SECURE_AUTH_KEY',  'CWH$AV}GnJBNYI:7k/DV0<:~uDC]@j|t0>-?Ey!@tcnk|+<|,4fW[%:Y>O*eY-vP');
define('LOGGED_IN_KEY',    'nb`}a*/&7<r;n+uc@Mz2>N[[Q*]FudT/z |j)2MaKLySa!y[h(q1N%/oBVny1mG;');
define('NONCE_KEY',        'GlHZ5TbKi3&=]|QOK-FL`@LV5!U)^-%)J|@*N.MK+Y1%[eY]kK-XQs:y%Dfuv _8');
define('AUTH_SALT',        '-R1P|+)^WWb@x@?1XNC[b<Dam0@jnvVP.k]+byMX[!p3k2s)DNwgU<N $lc9W%FL');
define('SECURE_AUTH_SALT', '@T#Vyy=bO):$oShV|SNR0/[A9|aqDxD=.kQ(c+d2HXPXp(><$#|uSOK2(h-]7L,+');
define('LOGGED_IN_SALT',   '#SspXfF3GG|?.a2QU5.O0%Q8dr+]t5bu$GzO{p8uo5s)Q@0{Zv*5J.:op5JM{<$|');
define('NONCE_SALT',       'iGE09:@i{59}`( kQl|qn?]>]dDQq%+o[Ql]Z4rPB+o2b`3D l[NH{{[,t4fXEaY');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

/*
*** to prevent worpdress from asking for the FTP credentials when it needs writing permissions
*/
define('FS_METHOD', 'direct');
