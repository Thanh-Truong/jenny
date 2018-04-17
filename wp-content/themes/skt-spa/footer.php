<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package SKT Spa
 */
?>
<footer id="footer">
	<div class="site-aligner">
    		<div class="widget-column">
             <div class="cols">
             <?php if ( '' !== get_theme_mod( 'footer_about_title' ) ){  ?>
             <h2><?php echo get_theme_mod('footer_about_title',__('About Wellness Spa', 'skt-spa')); ?></h2>
             <?php } ?>
             <?php if ( '' !== get_theme_mod( 'footer_about_desc' ) ){  ?>
                    <p><?php echo get_theme_mod('footer_about_desc', __('Integer pulvinar mauris magna, pretium faucibus nisl ornare sit amet. Quisque tempus odio id erat euismod, vel mollis nunc maxmus. Praesent dapibus diam magna, in pretium dolor interdum <br><br> Proin eu dui dapibus, mattis turpis nec, consectetur dui. Vestibulum tristique ut nisl in pellentesque. Proin tempus ex et finibus euismod. Nunc quam diam, ullamcorper eu nulla id, faucibus fermentum dolor. Donec et felis et lorem bibendum semper.', 'skt-spa')); ?></p>
              <?php  } ?>      
             </div>
       </div><!-- widget-column -->
       <div class="widget-column">
                <div class="cols"><h2><?php _e('Latest News','skt-spa'); ?></h2>
	<?php $args = array( 'posts_per_page' => 6, 'post__not_in' => get_option('sticky_posts'), 'orderby' => 'date', 'order' => 'desc' );
			query_posts( $args ); ?>
				<ul>
					<?php while ( have_posts() ) :  the_post(); ?>
                    		<li><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></li>
                    <?php endwhile; ?>
                </ul>
                </div><!-- cols -->
        </div><!-- widget-column -->
        <div class="widget-column">
        <?php if(!dynamic_sidebar('twitter-wid')) : ?>
                <div class="cols"><h2><?php _e('Latest Tweets','skt-spa'); ?></h2>
                   <p><?php _e('Use twitter widget for twitter feed.','skt-spa'); ?></p>
                </div><!-- cols -->
            <?php endif; ?>
            <!-- cols -->
        </div><!-- widget-column -->
        <div class="widget-column last">
            <div class="cols">
            		 <?php if ( '' !== get_theme_mod( 'contact_title' ) ){  ?>
                     <h2><?php echo get_theme_mod('contact_title',__('SKT Spa','skt-spa')); ?></h2>
                     <?php } ?>
                     <?php if ( '' !== get_theme_mod( 'contact_desc' ) ){  ?>
                     <p><?php echo get_theme_mod('contact_desc',__('Lorem Ipsum is simply dummy text of the printing and typesetting industry.','skt-spa')); ?></p>
                     <?php } ?>
                     <?php if ( '' !== get_theme_mod( 'contact_no' ) ){  ?>
                    <div class="foot-label"><?php _e('Phone : ','skt-spa'); ?></div><div class="phone-content"><?php echo get_theme_mod('contact_no',__('+123 456 7890','skt-spa')); ?></div><div class="clear"></div>
                    <?php } ?>
                    <?php if ( '' !== get_theme_mod( 'contact_fax_no' ) ){  ?>
                    <div class="foot-label"><?php _e('Fax : ','skt-spa'); ?></div><div class="add-content"><?php echo get_theme_mod('contact_fax_no',__('+9876543210','skt-spa')); ?></div><div class="clear"></div>
                    <?php } ?>
                    <?php if ( '' !== get_theme_mod( 'contact_mail' ) ){  ?>
                    <div class="foot-label"><?php _e('E-mail : ','skt-spa'); ?></div><div class="mail-content"><a href="mailto:<?php echo get_theme_mod('contact_mail','info@sitename.com'); ?>"><?php echo get_theme_mod('contact_mail','info@sitename.com'); ?></a></div><?php } ?><!-- mail-content --><div class="clear"></div>
 
                <div class="clear"></div>
                <div class="social">
				<?php if ( get_theme_mod('fb_link') != "") { ?>
                 <a target="_blank" href="<?php echo esc_url(get_theme_mod('fb_link','#facebook','skt-spa')); ?>" title="<?php esc_attr_e('Facebook','skt-spa');?>"><div class="fb icon"></div></a>
                 <?php } ?>
                <?php if ( get_theme_mod('twitt_link') != "") { ?>
                 <a target="_blank" href="<?php echo esc_url(get_theme_mod('twitt_link','#twitter','skt-spa')); ?>" title="<?php esc_attr_e('Twitter','skt-spa');?>"><div class="twitt icon"></div></a>
                 <?php } ?>
                 <?php if ( get_theme_mod('gplus_link') != "") { ?>
                 <a target="_blank" href="<?php echo esc_url(get_theme_mod('gplus_link','#gplus','skt-spa')); ?>" title="<?php esc_attr_e('Google Plus','skt-spa');?>"><div class="gplus icon"></div></a>
                 <?php } ?>
                 <?php if ( get_theme_mod('linked_link') != "") { ?>
                 <a target="_blank" href="<?php echo esc_url(get_theme_mod('linked_link','#linkedin','skt-spa')); ?>" title="<?php esc_attr_e('Linkedin','skt-spa');?>"><div class="linkedin icon"></div></a>
                 <?php } ?>
                </div>
            </div><!-- cols -->
       </div><!-- widget-column --><div class="clear"></div>
	</div><!-- site-aligner -->
</footer>
<div id="copyright">
	<div class="site-aligner">
    	<div class="left"><?php echo '&copy; '.date('Y').'';?>&nbsp;<?php bloginfo('name');?>&nbsp;<?php esc_attr_e('All Rights Reserved.','skt-spa');?></div>
        <div class="right"><?php echo skt_spa_themebytext(); ?></div>
        <div class="clear"></div>
    </div>
</div><!-- copyright -->
</div><!-- wrapper -->
<?php wp_footer(); ?>

</body>
</html>