<?php
/**
 * SKT skt-spa Theme Customizer
 *
 * @package SKT Spa
 */

/**
 * Add postMessage support for site title and description for the Theme Customizer.
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
 
function skt_spa_customize_register( $wp_customize ) {
	//Add a class for titles
    class skt_spa_Info extends WP_Customize_Control {
        public $type = 'info';
        public $label = '';
        public function render_content() {
        ?>
			<h3 style="text-decoration: underline; color: #DA4141; text-transform: uppercase;"><?php echo esc_html( $this->label ); ?></h3>
        <?php
        }
    }
	
	class WP_Customize_Textarea_Control extends WP_Customize_Control {
    public $type = 'textarea';
 
    public function render_content() {
        ?>
            <label>
                <span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
                <textarea rows="5" style="width:100%;" <?php $this->link(); ?>><?php echo esc_textarea( $this->value() ); ?></textarea>
            </label>
        <?php
    }
}
	
	$wp_customize->get_setting( 'blogname' )->transport         = 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport  = 'postMessage';
	$wp_customize->remove_control('header_textcolor');
	$wp_customize->remove_control('display_header_text');
	
	$wp_customize->add_setting('color_scheme',array(
			'default'	=> '#515151',
			'sanitize_callback'	=> 'sanitize_hex_color'
	));
	
	$wp_customize->add_control(
		new WP_Customize_Color_Control($wp_customize,'color_scheme',array(
			'label' => __('Color Scheme','skt-spa'),
 			'description' => __( 'More color options in PRO Version.', 'skt-spa' ),			
			'section' => 'colors',
			'settings' => 'color_scheme'
		))
	);
	
	$wp_customize->add_section('footer_text',array(
			'title'	=> __('Footer Text','skt-spa'),
			'priority'	=> null,
			'description'	=> __('','skt-spa')
	));

	$wp_customize->add_setting('footer_about_title',array(
			'default'	=> __('About Wellness Spa','skt-spa'),
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control('footer_about_title',array(
			'label'	=> __('Add about title here','skt-spa'),
			'setting'	=> 'footer_about_title',
			'section'	=> 'footer_text'
	));
	
	$wp_customize->add_setting('footer_about_desc',array(
			'default'	=> __('Integer pulvinar mauris magna, pretium faucibus nisl ornare sit amet. Quisque tempus odio id erat euismod, vel mollis nunc maxmus. Praesent dapibus diam magna, in pretium dolor interdum <br><br> Proin eu dui dapibus, mattis turpis nec, consectetur dui. Vestibulum tristique ut nisl in pellentesque. Proin tempus ex et finibus euismod. Nunc quam diam, ullamcorper eu nulla id, faucibus fermentum dolor. Donec et felis et lorem bibendum semper.','skt-spa'),
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control(
		new WP_Customize_Textarea_Control(
			$wp_customize,
			'footer_about_desc',
			array(
				'label'	=> __('Add about description here','skt-spa'),
				'setting'	=> 'footer_about_desc',
				'section'	=> 'footer_text'
			)
		)
	);	
	
	$wp_customize->add_section('slider_section',array(
		'title'	=> __('Slider Settings','skt-spa'),
 		'description' => __( 'Add slider images here. <br /> More slider settings available in PRO Version.', 'skt-spa' ),			
		'priority'		=> null
	));
	
	// Slide Image 1
	$wp_customize->add_setting('slide_image1',array(
		'default'	=> get_template_directory_uri().'/images/slides/slider1.jpg',
		'sanitize_callback'	=> 'esc_url_raw',
	));
	
	$wp_customize->add_control(
    new WP_Customize_Image_Control(
        $wp_customize,
        'slide_image1',
        array(
            'label' => __('Slide Image 1 (1400x446)','skt-spa'),
            'section' => 'slider_section',
            'settings' => 'slide_image1'
        )
    )
);

	$wp_customize->add_setting('slide_title1',array(
			'default'	=> __('Making Everyone Beautiful','skt-spa'),
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control(
		new WP_Customize_Textarea_Control(
			$wp_customize,
			'slide_title1',
			array(
				'label'	=> __('Slider Title 1','skt-spa'),
				'setting'	=> 'slide_title1',
				'section'	=> 'slider_section'
			)
		)
	);
	
	$wp_customize->add_setting('slide_desc1',array(
		'default'	=> __('Phasellus sit amet luctus risus, a dapibus purus. Quisque at ante sollicitudin, euismod erat eu, congue justo. Donec viverra ligula lectus Phasellus tempus sem ac tellus semper, eu ullamcorper purus pulvinar. Maecenas nisi sapien, rhoncus non tempus vitae, placerat ac ex.','skt-spa'),
		'sanitize_callback'	=> 'sanitize_text_field'	
	));
	
	$wp_customize->add_control(
		new WP_Customize_Textarea_Control(
			$wp_customize,
			'slide_desc1',
			array(
				'label'	=> __('Slider description  1','skt-spa'),
				'setting'	=> 'slide_desc1',
				'section'	=> 'slider_section'
			)
		)
	);
	
	$wp_customize->add_setting('slide_link1',array(
			'default'	=> '#link1',
			'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('slide_link1',array(
			'label'	=> __('Slide link 1','skt-spa'),
			'setting'	=> 'slide_link1',
			'section'	=> 'slider_section'
	));
	
	$wp_customize->add_setting('slide_image2',array(
			'default'	=> get_template_directory_uri().'/images/slides/slider2.jpg',
			'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control(
		new WP_Customize_Image_Control(
			$wp_customize,
			'slide_image2',
			array(
				'label'	=> __('Slide image 2','skt-spa'),
				'setting'	=> 'slide_image2',
				'section'	=> 'slider_section'
			)
		)
	);
	
	$wp_customize->add_setting('slide_title2',array(
			'default'	=> __('Restoring Balance & Natural Health','skt-spa'),
			'sanitize_callback'		=> 'sanitize_text_field',
	));
	
	$wp_customize->add_control(
		new WP_Customize_Textarea_Control(
			$wp_customize,
			'slide_title2',
			array(
				'label'	=> __('Slider Title 2','skt-spa'),
				'setting'	=> 'slide_title2',
				'section'	=> 'slider_section'
			)
		)
	);
	
	$wp_customize->add_setting('slide_desc2',array(
			'default'	=> __('Quisque at ante sollicitudin, euismod erat eu, congue justo. Phasellus sit amet luctus risus, a dapibus purus. Donec viverra ligula lectus Phasellus tempus sem ac tellus semper, eu ullamcorper purus pulvinar. Maecenas nisi sapien, rhoncus non tempus vitae, placerat ac ex.','skt-spa'),
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control(
		new WP_Customize_Textarea_Control(
			$wp_customize,
			'slide_desc2',
			array(
				'label'	=> __('Slide description 2','skt-spa'),
				'setting'	=> 'slide_desc2',
				'section'	=> 'slider_section'
			)
		)
	);
	
	$wp_customize->add_setting('slide_link2',array(
			'default'	=> '#link2',
			'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('slide_link2',array(
		'label'	=> __('Slide link 2','skt-spa'),
		'setting'	=> 'slide_link2',
		'section'	=> 'slider_section'
	));
 
	$wp_customize->add_setting('slide_image3',array(
		'default'	=> get_template_directory_uri().'/images/slides/slider3.jpg',
		'sanitize_callback'	=> 'esc_url_raw',
	));
	
	$wp_customize->add_control(
    new WP_Customize_Image_Control(
        $wp_customize,
        'slide_image3',
        array(
            'label' => __('Slide Image 3 (1400x446)','skt-spa'),
            'section' => 'slider_section',
            'settings' => 'slide_image3'
        )
    )
);

	$wp_customize->add_setting('slide_title3',array(
			'default'	=> __('Spa Renewal','skt-spa'),
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control(
		new WP_Customize_Textarea_Control(
			$wp_customize,
			'slide_title3',
			array(
				'label'	=> __('Slider Title 3','skt-spa'),
				'setting'	=> 'slide_title3',
				'section'	=> 'slider_section'
			)
		)
	);
	
	$wp_customize->add_setting('slide_desc3',array(
		'default'	=> __('Phasellus tempus sem ac at ante sollicitudin, euismod erat eu, congue justo. tellus semper, eu ullamcorper purus pulvinar. Maecenas nisi sapien, rhoncus non tempus vitae, placerat ac ex. Quisque Phasellus sit amet luctus risus, a dapibus purus. Donec viverra ligula lectus','skt-spa'),
		'sanitize_callback'	=> 'sanitize_text_field'	
	));
	
	$wp_customize->add_control(
		new WP_Customize_Textarea_Control(
			$wp_customize,
			'slide_desc3',
			array(
				'label'	=> __('Slider description  3','skt-spa'),
				'setting'	=> 'slide_desc3',
				'section'	=> 'slider_section'
			)
		)
	);
	
	$wp_customize->add_setting('slide_link3',array(
			'default'	=> '#link3',
			'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('slide_link3',array(
			'label'	=> __('Slide link 3','skt-spa'),
			'setting'	=> 'slide_link3',
			'section'	=> 'slider_section'
	)); 
	
	$wp_customize->add_setting('hide_slider',array(
			'sanitize_callback' => 'sanitize_text_field',
	));	 

	$wp_customize->add_control( 'hide_slider', array(
    	   'section'   => 'slider_section',
    	   'label'     => __('Hide This Section','skt-spa'),
    	   'type'      => 'checkbox'
     ));	
	
// Section Below Slider
	$wp_customize->add_section('wlcm_box',array(
		'title'	=> __('Welcome Content Below Slider','skt-spa'),
		'description'	=> __('Select Page from the dropdown','skt-spa'),
		'priority'	=> null
	));
	
	$wp_customize->add_setting('wlcmpage-setting',array(
			'sanitize_callback'	=> 'skt_spa_sanitize_integer'
	));
	
	$wp_customize->add_control('wlcmpage-setting',array(
			'type'	=> 'dropdown-pages',
			'label'	=> __('Select page for welcome section','skt-spa'),
			'section'	=> 'wlcm_box'	
	));
	
	$wp_customize->add_setting('hide_wlcm',array(
			'sanitize_callback' => 'sanitize_text_field',
	));	 

	$wp_customize->add_control( 'hide_wlcm', array(
    	   'section'   => 'wlcm_box',
    	   'label'     => __('Hide This Section','skt-spa'),
    	   'type'      => 'checkbox'
     ));	
// Section Below Slider
	
// Home Boxes 	
	$wp_customize->add_section('page_boxes',array(
		'title'	=> __('Home Four Boxes','skt-spa'),
 			'description' => sprintf( __( 'Featured Image Dimensions : ( 270 X 170 )<br/> Select Featured Image for these pages <br /> How to set featured image %s', 'skt-spa' ), sprintf( '<a href="%1$s" target="_blank">%2$s</a>', esc_url( '"'.SKT_THEME_FEATURED_SET_VIDEO_URL.'"' ), __( 'Click Here ?', 'skt-spa' )
						)
					),
		'priority'	=> null
	));	
	
	$wp_customize->add_setting(
    'page-setting1',
		array(
			'sanitize_callback' => 'skt_spa_sanitize_integer',
		)
	);
 
	$wp_customize->add_control(
		'page-setting1',
		array(
			'type' => 'dropdown-pages',
			'label' => __('Select page for box one:','skt-spa'),
			'section' => 'page_boxes',
		)
	);
	
	$wp_customize->add_setting('page-setting2',array(
			'sanitize_callback'	=> 'skt_spa_sanitize_integer'
	));
	
	$wp_customize->add_control('page-setting2',array(
			'type'	=> 'dropdown-pages',
			'label'	=> __('Select page for box two:','skt-spa'),
			'section'	=> 'page_boxes'	
	));
	
	$wp_customize->add_setting('page-setting3',array(
			'sanitize_callback'	=> 'skt_spa_sanitize_integer'
	));
	
	$wp_customize->add_control('page-setting3',array(
			'type'	=> 'dropdown-pages',
			'label'	=> __('Select page for box three:','skt-spa'),
			'section'	=> 'page_boxes'
	));
	
	
	$wp_customize->add_setting('page-setting4',array(
			'sanitize_callback'	=> 'skt_spa_sanitize_integer'
	));
	
	$wp_customize->add_control('page-setting4',array(
			'type'	=> 'dropdown-pages',
			'label'	=> __('Select page for box four:','skt-spa'),
			'section'	=> 'page_boxes'
	));	
	
	
	$wp_customize->add_setting('hide_boxes',array(
			'sanitize_callback' => 'sanitize_text_field',
	));	 

	$wp_customize->add_control( 'hide_boxes', array(
    	   'section'   => 'page_boxes',
    	   'label'     => __('Hide This Section','skt-spa'),
    	   'type'      => 'checkbox'
     ));	
	
// Home Boxes
	$wp_customize->add_section('social_sec',array(
			'title'	=> __('Social Settings','skt-spa'),
	 		'description' => __( 'Add social icons link here. <br><strong>More icon available in PRO Version.', 'skt-spa' ),			
			'priority'		=> null
	));
	
	$wp_customize->add_setting('fb_link',array(
			'default'	=> '#facebook',
			'sanitize_callback'	=> 'esc_url_raw'	
	));
	
	$wp_customize->add_control('fb_link',array(
			'label'	=> __('Add facebook link here','skt-spa'),
			'setting'	=> 'fb_link',
			'section'	=> 'social_sec'
	));
	
	$wp_customize->add_setting('twitt_link',array(
			'default'	=> '#twitter',
			'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('twitt_link',array(
			'label'	=> __('Add twitter link here','skt-spa'),
			'setting'	=> 'twitt_link',
			'section'	=> 'social_sec'
	));
	
	$wp_customize->add_setting('gplus_link',array(
			'default'	=> '#gplus',
			'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('gplus_link',array(
			'label'	=> __('Add google plus link here','skt-spa'),
			'setting'	=> 'gplus_link',
			'section'	=> 'social_sec'
	));
	
	$wp_customize->add_setting('linked_link',array(
			'default'	=> '#linkedin',
			'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('linked_link',array(
			'label'	=> __('Add linkedin link here','skt-spa'),
			'setting'	=> 'linked_link',
			'section'	=> 'social_sec'
	));
	
	$wp_customize->add_section('contact_sec',array(
			'title'	=> __('Contact Details','skt-spa'),
			'description'	=> __('Add you contact details here','skt-spa'),
			'priority'	=> null
	));
	
	$wp_customize->add_setting('contact_title',array(
			'default'	=> __('Contact Us','skt-spa'),
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control('contact_title',array(
			'label'	=> __('Add contact title here','skt-spa'),
			'setting'	=> 'contact_title',
			'section'	=> 'contact_sec'
	));
	
	$wp_customize->add_setting('contact_desc',array(
			'default'	=> __('Lorem Ipsum is simply dummy text of the printing and typesetting industry.','skt-spa'),
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control(
		new WP_Customize_Textarea_Control(
			$wp_customize,
			'contact_desc',
			array(
				'label'	=> __('Add contact description here','skt-spa'),
				'setting'	=> 'contact_desc',
				'section'	=> 'contact_sec'
			)
		)
	);
	
	$wp_customize->add_setting('contact_no',array(
			'default'	=> __('+123 456 7890','skt-spa'),
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control('contact_no',array(
			'label'	=> __('Add contact number here.','skt-spa'),
			'setting'	=> 'contact_no',
			'section'	=> 'contact_sec'
	));
	
	$wp_customize->add_setting('contact_fax_no',array(
			'default'	=> __('+9876543210','skt-spa'),
			'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control('contact_fax_no',array(
			'label'	=> __('Add fax number here.','skt-spa'),
			'setting'	=> 'contact_fax_no',
			'section'	=> 'contact_sec'
	));	
	
	$wp_customize->add_setting('contact_mail',array(
			'default'	=> 'contact@company.com',
			'sanitize_callback'	=> 'sanitize_email'
	));
	
	$wp_customize->add_control('contact_mail',array(
			'label'	=> __('Add you email here','skt-spa'),
			'setting'	=> 'contact_mail',
			'section'	=> 'contact_sec'
	));
}
add_action( 'customize_register', 'skt_spa_customize_register' );

//Integer
function skt_spa_sanitize_integer( $input ) {
    if( is_numeric( $input ) ) {
        return intval( $input );
    }
}

function skt_spa_custom_css(){
		?>
        	<style type="text/css">
					#content h1.entry-title,
					.feature-box-main h2,
					.feature-box h2,
					.section-title,
					#footer .widget-column h2,
					.morebtn:hover,
					#sidebar aside ul li a:hover,
					.recent-post-title a:hover,
					#copyright a,
					.foot-label,
					.theme-default .nivo-caption a:hover,
					.latest-blog span a,
					.postmeta a:hover, 
					a, 
					#footer .widget-column a:hover, 
					#copyright a:hover,
					.blog-post-repeat .entry-summary a, 
					.entry-content a,
					#sidebar aside h3.widget-title,
					.blog-post-repeat .blog-title a{
						color:<?php echo get_theme_mod('color_scheme','#515151'); ?>;
					}
					.slide_more a:hover, .morebtn:hover{
						border-color:<?php echo get_theme_mod('color_scheme','#ff6d84'); ?>;
					}
					.feature-box .read-more,
					.yes,
					.blog-more,
					.slide_more,
					.theme-default .nivo-controlNav a.active,
					.site-nav li:hover ul li:hover, 
					.site-nav li:hover ul li.current-page-item,
					p.form-submit input[type="submit"],
					#sidebar aside.widget_search input[type="submit"], 
					.wpcf7 input[type="submit"], 
					.pagination ul li .current, .pagination ul li a:hover{
						background-color:<?php echo get_theme_mod('color_scheme','#515151'); ?>
					}
					.site-nav ul li ul li a,
					.site-nav ul li:hover ul li a,
					.site-nav li:hover a, 
					.site-nav li.current_page_item a,
 					.site-nav li:hover ul li:hover, 
					.site-nav li:hover ul li.current-page-item,
					.site-nav li:hover ul li{
						color:<?php echo get_theme_mod('color_scheme','#515151'); ?>
					}					
			</style>
	<?php }
add_action('wp_head','skt_spa_custom_css');	

/**
 * Binds JS handlers to make Theme Customizer preview reload changes asynchronously.
 */
function skt_spa_customize_preview_js() {
	wp_enqueue_script( 'skt_spa_customizer', get_template_directory_uri() . '/js/customize-preview.js', array( 'customize-preview' ), '20130508', true );
}
add_action( 'customize_preview_init', 'skt_spa_customize_preview_js' );


function skt_spa_custom_customize_enqueue() {
	wp_enqueue_script( 'skt-spa-custom-customize', get_template_directory_uri() . '/js/custom.customize.js', array( 'jquery', 'customize-controls' ), false, true );
}
add_action( 'customize_controls_enqueue_scripts', 'skt_spa_custom_customize_enqueue' );