<?php
/**
 * SKT Spa functions and definitions
 *
 * @package SKT Spa
 */

/**
 * Set the word limit of post content
 *
 * @since SKT Spa 1.0
 *  
*/

global $content_width;

if ( ! isset( $content_width ) )
$content_width = 640; /* pixels */

function skt_spa_content($limit) {
	$content = explode(' ', get_the_content(), $limit);
	if (count($content)>=$limit) {
	array_pop($content);
	$content = implode(" ",$content).'...';
	} else {
	$content = implode(" ",$content);
	}	
	$content = preg_replace("/<img[^>]+\>/i", " ", $content); 
	$content = preg_replace('/\[.+\]/','', $content);
	$content = apply_filters('the_content', $content);
	$content = str_replace(']]>', ']]&gt;', $content);
	return $content;
}

/**
 * Set the content width based on the theme's design and stylesheet.
 */

if ( ! function_exists( 'skt_spa_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which runs
 * before the init hook. The init hook is too late for some features, such as indicating
 * support post thumbnails.
 */
function skt_spa_setup() {
	load_theme_textdomain( 'skt-spa', get_template_directory() . '/languages' );
	add_theme_support( 'automatic-feed-links' );
	add_theme_support('woocommerce');
	add_theme_support( 'post-thumbnails' );
	add_theme_support( 'custom-header' );
	add_theme_support( 'title-tag' );
	add_theme_support( 'custom-logo', array(
		'height'      => 40,
		'width'       => 200,
		'flex-height' => true,
	) );
	add_theme_support( 'custom-header', array( 'header-text' => false ) );		
	add_image_size('skt-spa-homepage-thumb',240,145,true);
	register_nav_menus( array(
		'primary' => __( 'Primary Menu', 'skt-spa' ),
	) );
	add_theme_support( 'custom-background', array(
		'default-color' => 'fdfdf1'
	) );
	add_editor_style( 'editor-style.css' );
}
endif; // skt_spa_setup
add_action( 'after_setup_theme', 'skt_spa_setup' );

/**
 * Register widget area.
 *
 * @since SKT Spa 1.0
 * 
 * @link https://codex.wordpress.org/Function_Reference/register_sidebar
*/

function skt_spa_widgets_init() {
	register_sidebar( array(
		'name'          => __( 'Blog and Page Sidebar', 'skt-spa' ),
		'description'   => __( 'Appears on blog and page sidebar', 'skt-spa' ),
		'id'            => 'sidebar-1',
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h3 class="widget-title">',
		'after_title'   => '</h3>',
	) );
	
	register_sidebar( array(
		'name'          => __( 'Twitter Widget', 'skt-spa' ),
		'description'   => __( 'Appears on footer of the page', 'skt-spa' ),
		'id'            => 'twitter-wid',
		'before_widget' => '<div class="cols">',
		'after_widget'  => '</div>',
		'before_title'  => '<h2>',
		'after_title'   => '</h2>',
	) );
	
	
}
add_action( 'widgets_init', 'skt_spa_widgets_init' );

/**
 * Register Google fonts for Twenty Fifteen.
 *
 * @since SKT Spa 1.0
 *
 * @return string Google fonts URL for the theme.
 */

function skt_spa_font_url(){
		$font_url = '';
		
		/* Translators: If there are any character that are
		* not supported by Roboto, translate this to off, do not
		* translate into your own language.
		*/
		$roboto = _x('on', 'Roboto:on or off','skt-spa');
		
		$robotocondensed = _x('on', 'Roboto Condensed:on or off','skt-spa');
		
		/* Translators: If there are any character that are not
		* supported by Oswald, trsnalate this to off, do not
		* translate into your own language.
		*/
		$oswald = _x('on','Oswald:on or off','skt-spa');
		
		/* Translators: If there has any character that are not supported 
		*  by Scada, translate this to off, do not translate
		*  into your own language.
		*/
		$scada = _x('on','Scada:on or off','skt-spa');
		
		$lobster = _x('on','Lobster:on or off','skt-spa');
		
		if('off' !== $roboto || 'off' !== $oswald){
			$font_family = array();
			
			if('off' !== $roboto){
				$font_family[] = 'Roboto:300,400,600,700,800,900';
			}
			if('off' !== $robotocondensed){
				$font_family[] = 'Roboto Condensed:400,300,700,700italic,400italic,300italic';
			}			
			if('off' !== $oswald){
				$font_family[] = 'Oswald:300,400,600,700';
			}
			if('off' !== $scada){
				$font_family[] = 'Scada:300,400,600,700';
			}
			if('off' !== $lobster){
				$font_family[] = 'Lobster:400';
			}			
			$query_args = array(
				'family'	=> urlencode(implode('|',$font_family)),
			);
			
			$font_url = add_query_arg($query_args,'//fonts.googleapis.com/css');
		}
		
	return $font_url;
	}

/**
 * Enqueue scripts and styles.
 *
 * @since SKT Spa 1.0
 */

function skt_spa_scripts() {
	wp_enqueue_style('skt-spa-font', skt_spa_font_url(), array());
	wp_enqueue_style( 'skt-spa-basic-style', get_stylesheet_uri() );
	wp_enqueue_style( 'skt-spa-editor-style', get_template_directory_uri()."/editor-style.css" );
	wp_enqueue_style( 'skt-spa-nivoslider-style', get_template_directory_uri()."/css/nivo-slider.css" );
	wp_enqueue_style( 'skt-spa-main-style', get_template_directory_uri()."/css/main.css" );		
	wp_enqueue_style( 'skt-spa-base-style', get_template_directory_uri()."/css/style-base.css" );
	wp_enqueue_script( 'skt-spa-nivo-script', get_template_directory_uri() . '/js/jquery.nivo.slider.js', array('jquery') );
	wp_enqueue_script( 'skt-spa-custom-js', get_template_directory_uri() . '/js/custom.js' );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'skt_spa_scripts' );

/**
 * Page Pagination 
 *
 * @since SKT Spa 1.0
 */
 
function skt_spa_pagination() {
	global $wp_query;
	$big = 12345678;
	$page_format = paginate_links( array(
	    'base' => str_replace( $big, '%#%', esc_url( get_pagenum_link( $big ) ) ),
	    'format' => '?paged=%#%',
	    'current' => max( 1, get_query_var('paged') ),
	    'total' => $wp_query->max_num_pages,
	    'type'  => 'array'
	) );
	if( is_array($page_format) ) {
		$paged = ( get_query_var('paged') == 0 ) ? 1 : get_query_var('paged');
		echo '<div class="pagination"><div><ul>';
		echo '<li><span>'. $paged . __('of', 'skt-spa') . $wp_query->max_num_pages .'</span></li>';
		foreach ( $page_format as $page ) {
			echo "<li>$page</li>";
		}
		echo '</ul></div></div>';
	}
}

define('SKT_URL','http://www.sktthemes.net','skt-spa');
define('SKT_THEME_URL','http://www.sktthemes.net/themes','skt-spa');
define('SKT_THEME_DOC','http://sktthemesdemo.net/documentation/skt-spa-doc/','skt-spa');
define('SKT_PRO_THEME_URL','http://www.sktthemes.net/shop/beauty-spa-wordpress-theme/','skt-spa');
define('SKT_THEME_FEATURED_SET_VIDEO_URL','https://www.youtube.com/watch?v=310YGYtGLIM','skt-spa');
define('SKT_LIVE_DEMO','http://sktthemesdemo.net/spa/','skt-spa');
define('SKT_FREE_URL','http://www.sktthemes.net/product-category/free-wordpress-themes/','skt-spa');

/**
 * Implement the Custom Header feature.
 *
 * @package SKT Spa 1.0
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template for about theme.
 */
require get_template_directory() . '/inc/about-themes.php';

/**
 * Custom template tags for this theme.
 *
 * @package SKT Spa 1.0
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Custom functions that act independently of the theme templates.
 *
 * @package SKT Spa 1.0
 */
require get_template_directory() . '/inc/extras.php';

/**
 * Customizer additions.
 *
 * @package SKT Spa 1.0
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 *
 * @package SKT Spa 1.0
 */
require get_template_directory() . '/inc/jetpack.php';

/**
 * Blog Post Pagination 
 *
 * @since SKT Spa 1.0
 */

function skt_spa_custom_blogpost_pagination( $wp_query ){
	$big = 999999999; // need an unlikely integer
	if ( get_query_var('paged') ) { $pageVar = 'paged'; }
	elseif ( get_query_var('page') ) { $pageVar = 'page'; }
	else { $pageVar = 'paged'; }
	$pagin = paginate_links( array(
		'base' 			=> str_replace( $big, '%#%', esc_url( get_pagenum_link( $big ) ) ),
		'format' 		=> '?'.$pageVar.'=%#%',
		'current' 		=> max( 1, get_query_var($pageVar) ),
		'total' 		=> $wp_query->max_num_pages,
		'prev_text'		=> __('&laquo; Prev', 'skt-spa'),
		'next_text' 	=> __('Next &raquo;', 'skt-spa'),
		'type'  => 'array'
	) ); 
	if( is_array($pagin) ) {
		$paged = ( get_query_var('paged') == 0 ) ? 1 : get_query_var('paged');
		echo '<div class="pagination"><div><ul>';
		echo '<li><span>'. $paged . __('of', 'skt-spa') . $wp_query->max_num_pages .'</span></li>';
		foreach ( $pagin as $page ) {
			echo "<li>$page</li>";
		}
		echo '</ul></div></div>';
	} 
}

/**
 * Get Slug By Id
 *
 * @since SKT Spa 1.0
 */
function skt_spa_get_slug_by_id($id) {
	$post_data = get_post($id, ARRAY_A);
	$slug = $post_data['post_name'];
	return $slug; 
}


if ( ! function_exists( 'skt_spa_the_custom_logo' ) ) :
/**
 * Displays the optional custom logo.
 *
 * Does nothing if the custom logo is not available.
 *
 */
function skt_spa_the_custom_logo() {
	if ( function_exists( 'the_custom_logo' ) ) {
		the_custom_logo();
	}
}
endif;

function skt_spa_themebytext(){
		return "<a href=".esc_url(SKT_FREE_URL)." target='_blank' rel='nofollow'>SKT Spa Theme</a>";
}