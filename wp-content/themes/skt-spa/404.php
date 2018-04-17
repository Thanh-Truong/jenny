<?php
/**
 * The template for displaying 404 pages (Not Found).
 *
 * @package SKT Spa
 */

get_header(); ?>
<div id="content">
  <div class="site-aligner">
    <section class="site-main content-left" id="sitemain">
        <h1 class="entry-title">
          <?php _e( '404 Not Found', 'skt-spa' ); ?>
        </h1>
      <!-- .page-header -->
      <div class="page-content">
        <p class="text-404">
          <?php _e( 'Looks like you have taken a wrong turn Dont worry... it happens to the best of us.', 'skt-spa' ); ?>
        </p>
      </div>
      <!-- .page-content --> 
    </section>
    <div class="sidebar_right notfound">
      <?php get_sidebar();?>
    </div>
    <div class="clear"></div>
  </div>
</div>

<?php get_footer(); ?>