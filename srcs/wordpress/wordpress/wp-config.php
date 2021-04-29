<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'mysql' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', '1234' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'mysql' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'xL)#C/#O`9Uj]I~I[el2$W~Pt#nyo1wp|Z#SrT!),LBWJ(6Sxu6K?0>JN)Ijk~@0' );
define( 'SECURE_AUTH_KEY',  '=35nBFb}$~xFsMU7c.O0}FAet4!f*w9O{9aOB18c:pTj9$SORbk)J7`h`h!ICbQ7' );
define( 'LOGGED_IN_KEY',    'C|Ly;dGS4{+)^Rxy[%Gs=wI?fNAxR8Q5Yf>W7qKXz|*o#?8nOz rt K7jlk]0aU|' );
define( 'NONCE_KEY',        'okEvhC9tGASutn*n]wl9:{Ov8=%5.UT3|F,<e+Dl:vAdm5[J9VKL^xn8P i;Mf{{' );
define( 'AUTH_SALT',        '5fQlYbp!2EyC,([.5o`;R`6hJ?xgwJZ5xh23-o?a7/O4lPziHDU.&!V~n!+T0Cg>' );
define( 'SECURE_AUTH_SALT', 'wYuQfO@E|Mnn(Lj!jKS~s48?KeK:/qf<L+(vDm|WV{F>>KM?;h:gmOj<.Qovx64x' );
define( 'LOGGED_IN_SALT',   '!H$2{{J26M,yrbe9hak_4E5?L3l;/4IQaBkN8E~/1-KG~4c=;_,^1%Q|+]zY33/g' );
define( 'NONCE_SALT',       '9D.H?0L2[~MS [Zd/{dgRpO@S((`2YAWU~x06v`37FAr6AF3=k}x.u:d$j8^:?yp' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );
