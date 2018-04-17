<?php
/**
 * The template for displaying Search Results pages.
 *
 * @package SKT Spa
 */

get_header(); ?>
<div id="content">
  <div class="site-aligner">
    <section class="site-main content-left" id="sitemain">
      <div>
        <?php if ( have_posts() ) : ?>
          <h1 class="entry-title"><?php printf( __( 'Search Results for: %s', 'skt-spa' ), '<span>' . get_search_query() . '</span>' ); ?></h1>
        <?php while ( have_posts() ) : the_post(); ?>
        <?php get_template_part( 'content', 'search' ); ?>
        <?php endwhile; ?>
        <?php skt_spa_pagination(); ?>
        <?php else : ?>
        <?php get_template_part( 'no-results', 'search' ); ?>
        <?php endif; ?>
      </div>
      <!-- blog-post --> 
    </section>
    <div class="sidebar_right notfound">
      <?php get_sidebar();?>
    </div>
    <!-- sidebar_right -->
    <div class="clear"></div>
  </div>
  <!-- site-aligner --> 
</div>
<!-- content -->
<?php get_footer(); ?>