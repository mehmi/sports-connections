<?php

namespace App\Models\Admin;

use App\Models\AppModel;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PageContent extends AppModel
{
    use HasFactory;
    protected $table = 'pages_content';
    public $timestamps = false;

    public static function getData($type, $name, $dataType)
    {
        $values = PageContent::select('pages_content.id','pages_content.data')->where('type',$type)->where('name',$name)->first();
        if($dataType == 'data')
        {
            return isset($values) && $values ? json_decode($values->data) : [];
        }
        elseif($dataType == 'image')
        {
          return isset($values) && $values ? $values : [];
        }
        elseif($dataType == 'json')
        {
          return isset($values) && $values ? json_decode($values->data , true) : [];
        }
    }
    
    public static function put($type, $key, $value)
    { 
        $data = self::where('type', $type)->where('name', $key)->first();
        
        if (!empty($data))
        {
            $data->data = $value ? $value : NULL;
            return $data->save();
        }
        else
        {
            $data = new PageContent();
            $data->type = isset($type) && $type ? $type : NULL;
            $data->name = isset($key) && $key ? $key : NULL;
            $data->data = isset($value) && $value ? $value : NULL;
            $data->save();
            return true;
        }

        return false;
    }

    public static function getAllData($type)
    {
        $data = PageContent::select('data','name')->where(['type' => $type])->get();
        $getAll = [];

        if(!empty($data))
        {
            foreach ($data as $key => $value) 
            {
                if (is_string($value->data) && isJson($value->data))
                {
                    $decodedData = json_decode($value->data, true);
                    if ($decodedData !== null) 
                    {
                        $getAll[$value->name] = $decodedData;
                    }
                    else
                    {
                        $getAll[$value->name] = $value->data;
                    }
                }
                else
                {
                    $getAll[$value->name] = $value->data;
                }
            }           
        }

        return $getAll;
    }

    public static function getRow($type , $name , $dataType)
    {
        $getRow = PageContent::select('data')->where(['type' => $type , 'name' => $name])->first();

        if($dataType == 'data')
        {
            $res = isset($getRow) && $getRow ? json_decode($getRow->data ,true) : [];
        }elseif($dataType == 'image'){
            $res = isset($getRow) && $getRow ? $getRow->data : [];
        }else{
            $res = [];
        }

        return $res;
    }  

}
