<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package SKT Spa
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
<?php wp_head(); ?>
</head>
<body <?php body_class(''); ?>>
	<div id="wrapper">
<div class="topbararea">
<div class="topfirstbar">
	<div class="topbarleft">
	<?php if( get_theme_mod('contact_mail')){ ?><a href="mailto:<?php echo sanitize_email(get_theme_mod('contact_mail')); ?>"><?php echo get_theme_mod('contact_mail'); ?></a><?php } else { ?><a href="mailto:<?php echo sanitize_email('info@sitename.com'); ?>"><?php echo 'info@sitename.com'; ?></a><?php }?>&nbsp;&nbsp;|&nbsp;&nbsp;<?php if( get_theme_mod('contact_no')){ _e( get_theme_mod('contact_no', 'skt-spa'));}else{echo '+1 800 234 5678';}?>         
    </div>
    <div class="topbarright">
     <div class="topsocial">
     	<?php if ( '' !== get_theme_mod( 'fb_link' ) || '' !== get_theme_mod( 'twitt_link' ) || '' !== get_theme_mod( 'gplus_link' ) || '' !== get_theme_mod( 'linked_link' ) ){  ?>
     	<span><?php _e('Follow us :-','skt-spa'); ?></span>
        <?php }?> 
        				<?php if ( '' !== get_theme_mod( 'fb_link' ) ){  ?>
                         <a target="_blank" href="<?php echo esc_url(get_theme_mod('fb_link','#facebook','skt-spa')); ?>" title="<?php esc_attr_e('Facebook','skt-spa');?>"><div class="fb icon"></div></a>
                         <?php } ?>
                        <?php if ( '' !== get_theme_mod( 'twitt_link' ) ){ ?>
                         <a target="_blank" href="<?php echo esc_url(get_theme_mod('twitt_link','#twitter','skt-spa')); ?>" title="<?php esc_attr_e('Twitter','skt-spa');?>"><div class="twitt icon"></div></a>
                         <?php } ?>
                         <?php if ( '' !== get_theme_mod( 'gplus_link' ) ){ ?>
                         <a target="_blank" href="<?php echo esc_url(get_theme_mod('gplus_link','#gplus','skt-spa')); ?>" title="<?php esc_attr_e('Google Plus','skt-spa');?>"><div class="gplus icon"></div></a>
                         <?php } ?>
                         <?php if ( '' !== get_theme_mod( 'linked_link' ) ){ ?>
                         <a target="_blank" href="<?php echo esc_url(get_theme_mod('linked_link','#linkedin','skt-spa')); ?>" title="<?php esc_attr_e('Linkedin','skt-spa');?>"><div class="linkedin icon"></div></a>
                         <?php } ?>
     </div>	
    </div>
    <div class="clear"></div>
</div>
</div>    
    	<div class="header">
        		<div class="site-aligner">
                	<div class="logo">
                    			<?php skt_spa_the_custom_logo(); ?>
                            	<h2><a href="<?php echo esc_url(home_url('/')); ?>"><?php bloginfo('name'); ?></a></h2>
                                <p><?php bloginfo('description'); ?></p>
                    </div><!-- logo -->
                    <div class="mobile_nav"><a href="#"><?php _e('Menu','skt-spa'); ?></a></div>
                    <div class="site-nav">
                    		<?php wp_nav_menu(array('theme_location' => 'primary')); ?>
                    </div><!-- site-nav --><div class="clear"></div>
                </div><!-- site-aligner -->
        </div><!-- header -->
 
<?php if ( is_front_page() && is_home() ) { ?>
<?php if( get_theme_mod( 'hide_slider' ) == '') { ?>
<section id="home_slider">
        	<?php
			$sldimages = ''; 
			$sldimages = array(
						'1' => get_template_directory_uri().'/images/slides/slider1.jpg',
						'2' => get_template_directory_uri().'/images/slides/slider2.jpg',
						'3' => get_template_directory_uri().'/images/slides/slider3.jpg',
			); ?>
            
        	<?php
			$slAr = array();
			$m = 0;
			for ($i=1; $i<4; $i++) {
				if ( get_theme_mod('slide_image'.$i, $sldimages[$i]) != "" ) {
					$imgSrc 	= get_theme_mod('slide_image'.$i, $sldimages[$i]);
					$imgTitle	= get_theme_mod('slide_title'.$i);
					$imgDesc	= get_theme_mod('slide_desc'.$i);
					$imgLink	= get_theme_mod('slide_link'.$i);
					if ( strlen($imgSrc) > 3 ) {
						$slAr[$m]['image_src'] = get_theme_mod('slide_image'.$i, $sldimages[$i]);
						$slAr[$m]['image_title'] = get_theme_mod('slide_title'.$i);
						$slAr[$m]['image_desc'] = get_theme_mod('slide_desc'.$i);
						$slAr[$m]['image_link'] = get_theme_mod('slide_link'.$i);
						$m++;
					}
				}
			}
			$slideno = array();
			if( $slAr > 0 ){
				$n = 0;?>
                <div class="slider-wrapper theme-default"><div id="slider" class="nivoSlider">
                <?php 
                foreach( $slAr as $sv ){
                    $n++; ?><img src="<?php echo esc_url($sv['image_src']); ?>" alt="<?php echo esc_attr($sv['image_title']);?>" title="<?php esc_attr_e('#slidecaption'.$n, 'skt-spa') ; ?>" /><?php
                    $slideno[] = $n;
                }
                ?>
                </div><?php
                foreach( $slideno as $sln ){ ?>
                    <div id="slidecaption<?php echo $sln; ?>" class="nivo-html-caption">
                    <div class="slide_info">
                            <h1><?php echo esc_attr(get_theme_mod('slide_title'.$sln, __('Slide Title','skt-spa').$sln)); ?></h1>
                            <p><?php  echo esc_attr(get_theme_mod('slide_desc'.$sln, __('Slide Description','skt-spa').$sln)); ?></p>
                            <div class="clear"></div>
                            <div class="slide_more"><a href="<?php echo esc_url(get_theme_mod('slide_link'.$sln,'#link'.$sln)); ?>"><?php _e('Read More', 'skt-spa');?></a></div>
                    </div>
                    </div><?php 
                } ?>
                </div>
                <div class="clear"></div><?php 
			}
            ?>
        </section>
<?php } ?>        
<div class="feature-box-main site-aligner">
<?php if( get_theme_mod( 'hide_wlcm' ) == '') { ?>
	<?php 
    if( get_theme_mod('wlcmpage-setting')) { 
    $queryvarwlcm = new WP_query('page_id='.get_theme_mod('wlcmpage-setting' ,true)); 
    while( $queryvarwlcm->have_posts() ) : $queryvarwlcm->the_post();
    ?>
    <h2><?php the_title(); ?></h2>
    <?php the_content(); ?>
    <?php endwhile; } else { ?>
    <h2><?php _e('Welcome to Wellness Spa','skt-spa'); ?></h2>
    <p><?php _e('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis malesuada ex non magna convallis aliquam. Nulla ullamcorper elit a ante ullamcorper, nec malesuada <br> massa commodo. In ut nisi nisl. Nullam porta fringilla purus, quis mollis enim tincidunt ut. Praesent vitae lacus ligula. Aliquam efficitur pharetra mauris, in molestie arcu<br> efficitur ornare. Vivamus sed finibus felis, nec cursus lorem.','skt-spa');?></p>
    <?php
  }
?>  
<?php } ?>
  <div class="clear"></div>
<?php if( get_theme_mod( 'hide_boxes' ) == '') { ?>  
<?php
for($tbx=1; $tbx<5; $tbx++) { ?>
<?php if( get_theme_mod('page-setting'.$tbx)) { ?>
<?php $fourboxquery = new WP_query('page_id='.get_theme_mod('page-setting'.$tbx,true)); ?>
<?php while( $fourboxquery->have_posts() ) : $fourboxquery->the_post(); ?>
<div class="feature-box"><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail(); ?></a>
<h2><?php the_title();?></h2>
<p><?php the_excerpt(); ?></p>
<a href="<?php the_permalink(); ?>" class="read-more"><?php _e('Read More','skt-spa');?></a>
</div> 
<!-- feature-box -->
<?php if($tbx%4==0) { ?>
<div class="clear"></div>
<?php } ?>
<?php endwhile; ?>
<?php wp_reset_postdata(); ?>
<?php } else { ?>
<div class="feature-box"><a href="<?php echo esc_url('#'); ?>"><img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/spabox<?php echo esc_attr($tbx); ?>.jpg" /></a>
<h2><?php _e('Spa','skt-spa'); ?> <?php echo esc_attr($tbx); ?></h2>
<p><?php _e('Aenean vitae pharetra tortor. Praesent tristique ante eu molestie cursus. Sed pulvinar aliquet tortor, non posuere augue rhoncus pellenesque. Maecenas fringilla ante ac.','skt-spa');?></p>
<a href="<?php echo esc_url('#'); ?>" class="read-more"><?php _e('Read More','skt-spa');?></a>
</div>
<!-- feature-box -->
<?php if($tbx%4==0) { ?>
<div class="clear"></div>
<?php
}  
} 
}
?>
<?php } ?>

</div>
<?php
}
elseif ( is_front_page() ) { 
?>
<?php if( get_theme_mod( 'hide_slider' ) == '') { ?>
<section id="home_slider">
        	<?php
			$sldimages = ''; 
			$sldimages = array(
						'1' => get_template_directory_uri().'/images/slides/slider1.jpg',
						'2' => get_template_directory_uri().'/images/slides/slider2.jpg',
						'3' => get_template_directory_uri().'/images/slides/slider3.jpg',
			); ?>
            
        	<?php
			$slAr = array();
			$m = 0;
			for ($i=1; $i<4; $i++) {
				if ( get_theme_mod('slide_image'.$i, $sldimages[$i]) != "" ) {
					$imgSrc 	= get_theme_mod('slide_image'.$i, $sldimages[$i]);
					$imgTitle	= get_theme_mod('slide_title'.$i);
					$imgDesc	= get_theme_mod('slide_desc'.$i);
					$imgLink	= get_theme_mod('slide_link'.$i);
					if ( strlen($imgSrc) > 3 ) {
						$slAr[$m]['image_src'] = get_theme_mod('slide_image'.$i, $sldimages[$i]);
						$slAr[$m]['image_title'] = get_theme_mod('slide_title'.$i);
						$slAr[$m]['image_desc'] = get_theme_mod('slide_desc'.$i);
						$slAr[$m]['image_link'] = get_theme_mod('slide_link'.$i);
						$m++;
					}
				}
			}
			$slideno = array();
			if( $slAr > 0 ){
				$n = 0;?>
                <div class="slider-wrapper theme-default"><div id="slider" class="nivoSlider">
                <?php 
                foreach( $slAr as $sv ){
                    $n++; ?><img src="<?php echo esc_url($sv['image_src']); ?>" alt="<?php echo esc_attr($sv['image_title']);?>" title="<?php esc_attr_e('#slidecaption'.$n, 'skt-spa') ; ?>" /><?php
                    $slideno[] = $n;
                }
                ?>
                </div><?php
                foreach( $slideno as $sln ){ ?>
                    <div id="slidecaption<?php echo $sln; ?>" class="nivo-html-caption">
                    <div class="slide_info">
                            <h1><?php echo esc_attr(get_theme_mod('slide_title'.$sln, __('Slide Title','skt-spa').$sln)); ?></h1>
                            <p><?php  echo esc_attr(get_theme_mod('slide_desc'.$sln, __('Slide Description','skt-spa').$sln)); ?></p>
                            <div class="clear"></div>
                            <div class="slide_more"><a href="<?php echo esc_url(get_theme_mod('slide_link'.$sln,'#link'.$sln)); ?>"><?php _e('Read More', 'skt-spa');?></a></div>
                    </div>
                    </div><?php 
                } ?>
                </div>
                <div class="clear"></div><?php 
			}
            ?>
        </section>
<?php } ?>        
<div class="feature-box-main site-aligner">
<?php if( get_theme_mod( 'hide_wlcm' ) == '') { ?>
	<?php 
    if( get_theme_mod('wlcmpage-setting')) { 
    $queryvarwlcm = new WP_query('page_id='.get_theme_mod('wlcmpage-setting' ,true)); 
    while( $queryvarwlcm->have_posts() ) : $queryvarwlcm->the_post();
    ?>
    <h2><?php the_title(); ?></h2>
    <?php the_content(); ?>
    <?php endwhile; } else { ?>
    <h2><?php _e('Welcome to Wellness Spa','skt-spa'); ?></h2>
    <p><?php _e('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis malesuada ex non magna convallis aliquam. Nulla ullamcorper elit a ante ullamcorper, nec malesuada <br> massa commodo. In ut nisi nisl. Nullam porta fringilla purus, quis mollis enim tincidunt ut. Praesent vitae lacus ligula. Aliquam efficitur pharetra mauris, in molestie arcu<br> efficitur ornare. Vivamus sed finibus felis, nec cursus lorem.','skt-spa');?></p>
    <?php
  }
?>  
<?php } ?>
  <div class="clear"></div>
<?php if( get_theme_mod( 'hide_boxes' ) == '') { ?>   
<?php
for($tbx=1; $tbx<5; $tbx++) { ?>
<?php if( get_theme_mod('page-setting'.$tbx)) { ?>
<?php $fourboxquery = new WP_query('page_id='.get_theme_mod('page-setting'.$tbx,true)); ?>
<?php while( $fourboxquery->have_posts() ) : $fourboxquery->the_post(); ?>
<div class="feature-box"><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail(); ?></a>
<h2><?php the_title();?></h2>
<p><?php the_excerpt(); ?></p>
<a href="<?php the_permalink(); ?>" class="read-more"><?php _e('Read More','skt-spa');?></a>
</div> 
<!-- feature-box -->
<?php if($tbx%4==0) { ?>
<div class="clear"></div>
<?php } ?>
<?php endwhile; ?>
<?php wp_reset_postdata(); ?>
<?php } else { ?>
<div class="feature-box"><a href="<?php echo esc_url('#'); ?>"><img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/spabox<?php echo esc_attr($tbx); ?>.jpg" /></a>
<h2><?php _e('Spa','skt-spa'); ?> <?php echo esc_attr($tbx); ?></h2>
<p><?php _e('Aenean vitae pharetra tortor. Praesent tristique ante eu molestie cursus. Sed pulvinar aliquet tortor, non posuere augue rhoncus pellenesque. Maecenas fringilla ante ac.','skt-spa');?></p>
<a href="<?php echo esc_url('#'); ?>" class="read-more"><?php _e('Read More','skt-spa');?></a>
</div>
<!-- feature-box -->
<?php if($tbx%4==0) { ?>
<div class="clear"></div>
<?php
}  
} 
}
?>
<?php } ?>

</div>
<?php
}
elseif ( is_home() ) {
?>
<section id="home_slider" style="display:none;"></section>
<div class="feature-box-main site-aligner" style="display:none;"></div>
<?php
}
?> 