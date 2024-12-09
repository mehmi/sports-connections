 
 @php
   use App\Libraries\FileSystem;
   use App\Libraries\General;
   if($files && isJson($files))
   {
   		$files = json_decode($files,true);
   }
 @endphp
@if(is_array($files) && !empty($files) && isset($files[0]))
<div class="owl-carousel owl-theme adminCarousel">
	@foreach ($files as $key => $value)
	    @php
	    	if($value && is_array($value))
	    	{
		       $fileExt = FileSystem::getExtension($value['large']);
		       $value = isset($value['large']) && $value['large'] ? $value['large'] : (isset($value['original']) && $value['original'] ? $value['original'] : "");
	    	}
	    	else
	    	{
	    		$value = FileSystem::getAllSizeImages($value);
	    		$fileExt = FileSystem::getExtension($value['large']);
		       	$value = isset($value['large']) && $value['large'] ? $value['large'] : (isset($value['original']) && $value['original'] ? $value['original'] : "");
	    	}
	    @endphp
	    @if(in_array($fileExt, ['mp4', 'avi', 'mov', 'flv']))
	        <div class="item {{ $key == 0 ? ' active' : '' }}">
			   <video src="{{URL::asset($value)}}" controls style="width:100%; height: 400px;"></video>
			</div>
	    @elseif(in_array($fileExt, ['png', 'jpg', 'jpeg', 'gif', 'svg']))
	        <div class="item {{ $key == 0 ? ' active' : '' }}">
			    <img src="{{ General::renderImage($value)}}"  style="width:100%; height: 400px;" alt="Image Not Found" >
			</div>
		@else
		    <div class="item ">
			    <img src="{{ General::renderImage($value)}}"  style="width:100%; height: 400px;" alt="Image Not Found">
			</div>	        
	    @endif
	@endforeach
</div>
@elseif(!empty($files))
	@php 
		if($files && is_array($files))
		{
			$fileExt = FileSystem::getExtension($files['large']);
		     $value = isset($files['medium']) && $files['medium'] ? $files['medium'] : (isset($value['original']) && $value['original'] ? $value['original'] : "");
	    }
	    else
	    {
	    	$files = FileSystem::getAllSizeImages($files);
		    $fileExt = FileSystem::getExtension($files['large']);
			$value = isset($files['medium']) && $files['medium'] ? $files['medium'] : (isset($value['original']) && $value['original'] ? $value['original'] : "");
	    }
	@endphp
	@if(in_array($fileExt, ['mp4', 'avi', 'mov', 'flv']))
        <div class="item ">
		   <video src="{{URL::asset($value)}}" controls style="width:100%; height: 400px;"></video>
		</div>
    @elseif(in_array($fileExt, ['png', 'jpg', 'jpeg', 'gif', 'svg']))
        <div class="item ">
		    <img src="{{ General::renderImage($value)}}"  style="width:100%; height: 400px;" alt="Image Not Found">
		</div>
	@else
	    <div class="item ">
		    <img src="{{ General::renderImage($value)}}"  style="width:100%; height: 400px;" alt="Image Not Found">
		</div>	        
    @endif
@endif
