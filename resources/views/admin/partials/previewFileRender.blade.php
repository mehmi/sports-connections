@php 
// CHAGE THE LOGIN AS PER YOUR FILE TYPE AND HANDLE MLTIPLE OR SINGLE IMAGE CASE
if($file)
{
	$multiple = json_decode($file, true);
	$allFiles = $multiple && is_array($multiple) ? $multiple : ($file ? [$file] : null);
	if($allFiles)
	{
		foreach($allFiles as $oldFile)
		{
			$extension = pathinfo($oldFile, PATHINFO_EXTENSION);
			$extension = strtolower($extension);
			if(in_array($extension, ['png', 'jpg', 'jpeg', 'gif', 'svg']))
			{
				$sizesFiles = FileSystem::getAllSizeImages($oldFile);
				$imageSrc = isset($sizesFiles['large']) && $sizesFiles['large'] ? $sizesFiles['large'] : $oldFile;

				if($imageSrc)
				{
					echo '<div class="single-image"><a href="javascript:;" class="fileRemover single-cross image" data-relation="'.(isset($relationType) && $relationType ? $relationType : null).'" data-relation-thumbnail="'.(isset($relationThumbnail) && $relationThumbnail ? $relationThumbnail : null).'" data-id="'.(isset($relationId) && $relationId ? $relationId : null).'" data-path="'.$oldFile.'" data-thumbnail="'.(isset($thumbnail) && $thumbnail ? $thumbnail : null).'"><i class="fas fa-times"></i></a><img src="'.url($imageSrc).'"></div>';
				}
			}
			else if(in_array($extension, ['mp3']))
			{
				if($oldFile)
				{
					$oldFileName = explode('/', $oldFile);
					$oldFileName = end($oldFileName);

					echo '<div class="single-file"><a href="'.url($oldFile).'" target="_blank"><i class="fas fa-volume"></i>'.$oldFileName.'</a><a href="javascript:;" class="fileRemover single-cross file" data-path="'.$oldFile.'" data-relation="'.(isset($relationType) && $relationType ? $relationType : null).'" data-id="'.(isset($relationId) && $relationId ? $relationId : null).'"><i class="fas fa-times"></i></a></div>';
				}
			}
			else if(in_array($extension, ['pdf']))
			{
				if($oldFile)
				{
					$oldFileName = explode('/', $oldFile);
					$oldFileName = end($oldFileName);

					echo '<div class="single-file"><a href="'.url($oldFile).'" target="_blank"><i class="far fa-file-pdf"></i>'.$oldFileName.'</a><a href="javascript:;" class="fileRemover single-cross file" data-path="'.$oldFile.'" data-relation="'.(isset($relationType) && $relationType ? $relationType : null).'" data-id="'.(isset($relationId) && $relationId ? $relationId : null).'"><i class="fas fa-times"></i></a></div>';
				}
			}
			else if(in_array($extension, ['docx']))
			{
				if($oldFile)
				{
					$oldFileName = explode('/', $oldFile);
					$oldFileName = end($oldFileName);

					echo '<div class="single-file"><a href="'.url($oldFile).'" target="_blank"><i class="far fa-file-word"></i>'.$oldFileName.'</a><a href="javascript:;" class="fileRemover single-cross file" data-path="'.$oldFile.'" data-relation="'.(isset($relationType) && $relationType ? $relationType : null).'" data-id="'.(isset($relationId) && $relationId ? $relationId : null).'"><i class="fas fa-times"></i></a></div>';
				}
			}
			else if(in_array($extension, ['mp4', 'avi', 'mov', 'flv']))
			{
				$sizesFiles = FileSystem::getAllVideoThumbnailImages($oldFile);
				$imageSrc = isset($sizesFiles['large']) && $sizesFiles['large'] ? $sizesFiles['large'] : $oldFile;
				
				if($imageSrc)
				{
					echo '<div class="single-image"><a href="javascript:;" class="fileRemover single-cross image" data-relation="'.(isset($relationType) && $relationType ? $relationType : null).'" data-relation-thumbnail="'.(isset($relationThumbnail) && $relationThumbnail ? $relationThumbnail : null).'" data-id="'.(isset($relationId) && $relationId ? $relationId : null).'" data-path="'.$oldFile.'" data-thumbnail="'.(isset($thumbnail) && $thumbnail ? $thumbnail : null).'"><i class="fas fa-times"></i></a><img src="'.url($imageSrc).'"><a class="video_play" href="'.url($oldFile).'" target="_blank"><i class="fas fa-play"></i></a></div>';
				}
			}
			else
			{
				if($oldFile)
				{
					$oldFileName = explode('/', $oldFile);
					$oldFileName = end($oldFileName);
					
					echo '<div class="single-file"><a href="'.url($oldFile).'" target="_blank"><i class="fas fa-file"></i>'.$oldFileName.'</a><a href="javascript:;" class="fileRemover single-cross file" data-path="'.$oldFile.'" data-thumbnail="'.(isset($thumbnail) && $thumbnail ? $thumbnail : null).'" data-relation="'.(isset($relationType) && $relationType ? $relationType : null).'" data-relation-thumbnail="'.(isset($relationThumbnail) && $relationThumbnail ? $relationThumbnail : null).'" data-id="'.(isset($relationId) && $relationId ? $relationId : null).'"><i class="fas fa-times"></i></a></div>';
				}
			}
		}
	}
}
@endphp