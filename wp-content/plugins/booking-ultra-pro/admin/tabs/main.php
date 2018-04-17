<?php
global $bookingultrapro, $bupcomplement, $bupultimate, $bup_filter;

$how_many_upcoming_app = 20;

//today
$today = $bookingultrapro->appointment->get_appointments_planing_total('today');
$tomorrow = $bookingultrapro->appointment->get_appointments_planing_total('tomorrow');
$week = $bookingultrapro->appointment->get_appointments_planing_total('week');

$pending = $bookingultrapro->appointment->get_appointments_total_by_status(0);
$cancelled = $bookingultrapro->appointment->get_appointments_total_by_status(2);
$noshow = $bookingultrapro->appointment->get_appointments_total_by_status(3);
$unpaid = $bookingultrapro->order->get_orders_by_status('pending');



//echo "current_time( 'timestamp' ) returns local site time: " . date( 'Y-m-d H:i:s', current_time( 'timestamp', 0 ) );
//echo "current_time( 'timestamp', 1 ) returns GMT: " . date( 'Y-m-d H:i:s', current_time( 'timestamp', 1 ) );



$va = get_option('bup_c_key');
				
if($va==''  && isset($bupultimate)){
					
	$this->display_ultimate_validate_copy();
					
}

        
?>

<div class="bup-welcome-panel">

<div class="welcome-panel-content">
	<h3 class="bup-welcome"><?php _e('Welcome to Booking Ultra Pro!','bookingup')?></h3>
    
    <span class="bup-main-close-open-tab"><a href="#" title="Close" class="bup-widget-home-colapsable" widget-id="1"><i class="fa fa-sort-asc " id="bup-close-open-icon-1" ></i></a></span>
	
	<div class="welcome-panel-column-container " id="bup-main-cont-home-1" >
	<div class="welcome-panel-column">
					<h4 ><?php _e('Quick Actions','bookingup')?> </h4>
                    
                     <div class="bup-appointments-getting-started">
           				 <ul>
                         
                         <li><a id="bup-create-new-app" href="#"><span><i class="fa fa-calendar"></i></span><?php _e('Create New Appointment','bookingup')?></a></li>
                         
                         </ul>
            
            
            
           			</div>
            
            
			
			</div>
            
	<div class="welcome-panel-column">
		<h4><?php _e('Planning','bookingup')?> </h4>
        
         <div class="bup-appointments-planning">
            <ul>
                        <li class="today"><h3><?php _e('Today','bookingup')?></h3><p class="today"><?php echo $today ?></p></li>
                        <li class="tomorrow"><h3><?php _e('Tomorrow','bookingup')?></h3><p class="tomorrow"><?php echo $tomorrow ?></p></li>
                        <li class="week"><h3><?php _e('This Week','bookingup')?></h3><p class="week"><?php echo $week ?></p></li>
                
            </ul>
            
             
        
        </div>
        	
            <div class="bup-status-planning">
        	<ul class="bup-appointments-status-sub">
             	
                
                <li class="today"><a href="#"  class="bup-adm-see-appoint-list-quick" bup-status='0' bup-type='bystatus'><?php _e('Pending','bookingup')?> <span class="count">(<span class="pending-count"><?php echo $pending?></span>)</span> | </a></li>
                <li class="today"><a href="#" class="bup-adm-see-appoint-list-quick" bup-status='2' bup-type='bystatus'><?php _e('Cancelled','bookingup')?> <span class="count">(<span class="cancelled-count"><?php echo $cancelled?></span>)</span> | </a> </li>
                
                <li class="today"><a href="#" class="bup-adm-see-appoint-list-quick" bup-status='3' bup-type='bystatus'><?php _e('No-Show','bookingup')?> <span class="count">(<span class="cancelled-count"><?php echo $noshow?></span>)</span> | </a> </li>
                
                <li class="today"><a href="#" class="bup-adm-see-appoint-list-quick" bup-status='3' bup-type='byunpaid'><?php _e('Unpaid','bookingup')?> <span class="count">(<span class="cancelled-count"><?php echo $unpaid?></span>)</span></a> </li>
                
                             
             	
             
             </ul>
             
          </div>
	</div>
    
	<div class="welcome-panel-column welcome-panel-last">
		<h4><?php _e('Upcoming Appointments','bookingup')?></h4>
        
        <div class="bup-latest-appointments">
                
       		 <?php echo $bookingultrapro->appointment->get_upcoming_app_list($how_many_upcoming_app);?>        
                   
        </div>
        
        
	</div>
	</div>
	</div>
    
    <p style="text-align:right" class="bup-timestamp-features"> <?php _e('Site Time: ','bookingup')?><?php echo date( 'Y-m-d H:i:s', current_time( 'timestamp', 0 ) )?> (Offset: <?php echo get_option('gmt_offset');?>) | <?php _e('GMT: ','bookingup')?>  <?php echo date( 'Y-m-d H:i:s', current_time( 'timestamp', 1 ) )?></p>
    
</div>

<?php if(isset($bupcomplement) && isset($bupultimate)){?>

<div class="bup-welcome-panel">

    <div class="welcome-panel-content">
        <h3 class="bup-welcome"><?php _e('Locations','bookingup')?></h3>
        
         <span class="bup-main-close-open-tab"><a href="#" title="Close" class="bup-widget-home-colapsable" widget-id="2"><i class="fa fa-sort-asc " id="bup-close-open-icon-2" ></i></a></span>
         
         <div class="welcome-panel-column-container " id="bup-main-cont-home-2" >
         
        	 <div class="bup-locations-home-cont "  >
         
         	 </div>
         
         </div>
     
    </div>
    
</div>

<?php }?>

<?php if(!isset($bupcomplement)){?>
<p class="bup-extra-features"><?php _e('Do you need more features or manage multiple locations, google calendar integration, change legends & colors?','bookingup')?> <a href="https://bookingultrapro.com/compare-packages.html" target="_blank">Click here</a> to see higher versions.</p>

<?php }?>
        <div class="bup-sect bup-welcome-panel">
        
        
        
        	<div id="full_calendar_wrapper">     
            
            <?php if(isset($bupcomplement) && isset($bupultimate)){?>
            
                <div class="bup-calendar-filters">
                
                       <?php echo $bup_filter->get_all_calendar_filter();?>          
                       <?php echo $bookingultrapro->userpanel->get_staff_list_calendar_filter();?> 
                       <button name="bup-btn-calendar-filter" id="bup-btn-calendar-filter" class="bup-button-submit-changes"><?php _e('Filter','bookingup')?>	</button>
                </div>  
            
            <?php }?>      
            	
                <div class="table-responsive">
                        <div class="ab-loading-inner" style="display: none">
                            <span class="ab-loader"></span>
                        </div>
                        <div class="bup-calendar-element"></div>
                </div>  
                
            </div> 
        
        </div>
        
     <div id="bup-appointment-new-box" title="<?php _e('Create New Appointment','bookingup')?>"></div>
     <div id="bup-appointment-edit-box" title="<?php _e('Edit Appointment','bookingup')?>"></div>     
     <div id="bup-new-app-conf-message" title="<?php _e('Appointment Created','bookingup')?>"></div> 
     <div id="bup-new-payment-cont" title="<?php _e('Add Payment','bookingup')?>"></div>
     <div id="bup-confirmation-cont" title="<?php _e('Confirmation','bookingup')?>"></div>
     <div id="bup-new-note-cont" title="<?php _e('Add Note','bookingup')?>"></div>     
     <div id="bup-appointment-list" title="<?php _e('Pending Appointments','bookingup')?>"></div>
     
     <div id="bup-client-new-box" title="<?php _e('Create New Client','bookingup')?>"></div>
           <div id="bup-appointment-change-status" title="<?php _e('Appointment Status','bookingup')?>"></div>

     
     
       
    
    <div id="bup-spinner" class="bup-spinner" style="display:">
            <span> <img src="<?php echo bookingup_url?>admin/images/loaderB16.gif" width="16" height="16" /></span>&nbsp; <?php echo __('Please wait ...','bookingup')?>
	</div>
    
    
    <script type="text/javascript">
	
			var err_message_payment_date ="<?php _e('Please select a payment date.','bookingup'); ?>";
			var err_message_payment_amount="<?php _e('Please input an amount','bookingup'); ?>"; 
			var err_message_payment_delete="<?php _e('Are you totally sure that you want to delete this payment?','bookingup'); ?>"; 
			
			var err_message_note_title ="<?php _e('Please input a title.','bookingup'); ?>";
			var err_message_note_text="<?php _e('Please input some text','bookingup'); ?>";
			var err_message_note_delete="<?php _e('Are you totally sure that you want to delete this note?','bookingup'); ?>"; 
			
			
			var gen_message_rescheduled_conf="<?php _e('The appointment has been rescheduled.','bookingup'); ?>"; 
			var gen_message_infoupdate_conf="<?php _e('The information has been updated.','bookingup'); ?>"; 
	
		     var err_message_start_date ="<?php _e('Please select a date.','bookingup'); ?>";
			 var err_message_service ="<?php _e('Please select a service.','bookingup'); ?>"; 
		     var err_message_time_slot ="<?php _e('Please select a time.','bookingup'); ?>";
			 var err_message_client ="<?php _e('Please select a client.','bookingup'); ?>";
			 var message_wait_availability ='<img src="<?php echo bookingup_url?>admin/images/loaderB16.gif" width="16" height="16" /></span>&nbsp; <?php echo __("Please wait ...","bookingup")?>'; 
			  
		
	</script>


     
