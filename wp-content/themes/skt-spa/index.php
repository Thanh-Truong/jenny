<?php
/**
 * The template for displaying home page.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site will use a
 * different template.
 *
 * @package SKT Spa
 */

get_header(); 
?>
<?php if ( 'page' == get_option( 'show_on_front' ) && ( '' != get_option( 'page_for_posts' ) ) && $wp_query->get_queried_object_id() == get_option( 'page_for_posts' ) ) : ?>

<div id="content">
  <div class="site-aligner">
    <section class="site-main content-left" id="sitemain">
      <div class="blog-post">
        <?php
         if ( have_posts() ) : while ( have_posts() ) : the_post();
		/*
		 * Include the post format-specific template for the content. If you want to
		 * use this in a child theme, then include a file called called content-___.php
		 * (where ___ is the post format) and that will be used instead.
		 */
         get_template_part( 'content', get_post_format() );
		 endwhile;
         // Previous/next post navigation.
         skt_spa_pagination();
		 else :
		 // If no content, include the "No posts found" template.
         get_template_part( 'no-results', 'index' );
         endif;
         ?>
      </div>
      <!-- blog-post --> 
    </section>
    <div class="sidebar_right">
      <?php get_sidebar();?>
    </div>
    <!-- sidebar_right -->
    <div class="clear"></div>
  </div>
  <!-- site-aligner --> 
</div>
<!-- content -->
<?php else: ?>
<section class="latest-blog">
  <div class="site-aligner">
    <div class="section-title">
      <?php _e('Latest Posts','skt-spa'); ?>
    </div>
    <div>
      <?php $k = 0; ?>
      <?php global $wp_query; ?>
      <?php while( $wp_query->have_posts() ) : $wp_query->the_post(); ?>
      <?php $k++; ?>
      <div class="one_third <?php if($k%3==0){?>last_column<?php } ?>">
        <p><a title="<?php the_title(); ?>" href="<?php the_permalink(); ?>">
          <?php if( has_post_thumbnail() ) { ?>
          <?php the_post_thumbnail(); ?>
          <?php } else {  ?>
          <img src="<?php echo esc_url(get_template_directory_uri()); ?>/images/img_404.png" />
          <?php } ?>
          </a> </p>
        <div class="recent-post-title"><a title="<?php the_title(); ?>" href="<?php the_permalink(); ?>">
          <?php the_title(); ?>
          </a> </div>
        <div class="recent-meta"><?php echo esc_html(get_the_author()); ?> | <?php echo esc_html(get_the_date()); ?> |
          <?php comments_number(); ?>
        </div>
        <div class="clear"></div>
        <?php if(function_exists('skt_spa_content')) { echo skt_spa_content(26); } ?>
        <div class="clear"></div>
        <a class="blog-more" href="<?php the_permalink(); ?>">
        <?php _e('Read More','skt-spa'); ?>
        </a> </div>
      <?php if($k%3==0){?>
      <div class="clear"></div>
      <?php } ?>
      <?php endwhile; ?>
    </div>
  </div>
  <div class="clear"></div>
</section>
<?php endif; ?>
<?php get_footer(); ?>