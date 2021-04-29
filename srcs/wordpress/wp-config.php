<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
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
define( 'DB_USER', 'mysql' );

/** MySQL database password */
define( 'DB_PASSWORD', '1234' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         ' OB9f_d]okh?>eg P=N@Ni{M,Bg^$D;tk;W] 1PM#Hbf)D8vbc^~ty]Rgqb,uwy-' );
define( 'SECURE_AUTH_KEY',  'm$PzuExk@g$M{A#1/Lj3~1$1M%a-.a{zMgPD5d~McS>Fp^*=8N,[v%*m5[o8yI4Y' );
define( 'LOGGED_IN_KEY',    '~xxx7q;D6-M-;r?S[]5XG2N)fw@t0MJ8dvXL_w]e6Y]zgp_uPk N33U^X#@0O7S#' );
define( 'NONCE_KEY',        ']=VhTfw>4jrs0pn_qq`g+v#*.I9j/Syb3tBt4&UOvk0O5NHO&~aaK@53BQiMw*{B' );
define( 'AUTH_SALT',        'k:e!aBj#_I54wSCtj0/xu;/X`RD!r1cxlqAfVW^wb,rY8`>l/z5QZDu:{u)*.h)U' );
define( 'SECURE_AUTH_SALT', 'k9X-SI2X5Bp[!Q/9:t[6X7#_{KYO6qX$FcM|CmjJmMVl+DdtnD<fE<g~#V6|neSp' );
define( 'LOGGED_IN_SALT',   'n5RQk2{gA==?HH &`(#ET=Gk#vjE?W[WzvWPn7P%!Fpmyv9|Ny=M3vz-KHR769)k' );
define( 'NONCE_SALT',       '9^;3dCl-Ex2ht|v|}ABR0J!Ianq/SoFc0fi`+H,^4-&=RD2*vD6bnh%@350_gGSO' );

/**#@-*/

/**
 * WordPress Database Table prefix.
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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

