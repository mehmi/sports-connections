<?php

namespace App\Models\Admin;

use App\Models\AppModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;
use App\Libraries\General;
use App\Libraries\FileSystem;
use App\Models\Admin\Setting;

class OurTeam extends AppModel
{
    protected $table = 'our_team';
    protected $primaryKey = 'id';

    /**** ONLY USE FOR MAIN TALBLES NO NEED TO USE FOR RELATION TABLES OR DROPDOWNS OR SMALL SECTIONS ***/
    use SoftDeletes;
    
    /**
    * Slider -> Admins belongsTO relation
    * 
    * @return Admins
    */
    public function owner()
    {
        return $this->belongsTo(Admin::class, 'created_by', 'id');
    }
    
    /**
    * To search and get pagination listing
    * @param Request $request
    * @param $limit
    */

    public static function getListing(Request $request, $where = [])
    {
        $orderBy = $request->get('sort') ? $request->get('sort') : 'our_team.id';
        $direction = $request->get('direction') ? $request->get('direction') : 'desc';
        $page = $request->get('page') ? $request->get('page') : 1;
        $limit = self::$paginationLimit;
        $offset = ($page - 1) * $limit;
        
        $listing = OurTeam::select([
                'our_team.*',
                'owner.first_name as owner_first_name',
                'owner.last_name as owner_last_name'
            ])
            ->leftJoin('admins as owner', 'owner.id', '=', 'our_team.created_by')
            ->orderBy($orderBy, $direction);

        if(!empty($where))
        {
            foreach($where as $query => $values)
            {
                if(is_array($values))
                    $listing->whereRaw($query, $values);
                elseif(!is_numeric($query))
                    $listing->where($query, $values);
                else
                    $listing->whereRaw($values);
            }
        }

        // Put offset and limit in case of pagination
        if($page !== null && $page !== "" && $limit !== null && $limit !== "")
        {
            $listing->offset($offset);
            $listing->limit($limit);
        }

        $listing = $listing->paginate($limit);

        return $listing;
    }

    /**
    * To get all records
    * @param $where
    * @param $orderBy
    * @param $limit
    */
    public static function getAll($select = [], $where = [], $orderBy = 'our_team.id desc', $limit = null)
    {
        $listing = OurTeam::orderByRaw($orderBy);

        if(!empty($select))
        {
            $listing->select($select);
        }
        else
        {
            $listing->select([
                'our_team.*'
            ]); 
        }

        if(!empty($where))
        {
            foreach($where as $query => $values)
            {
                if(is_array($values))
                    $listing->whereRaw($query, $values);
                elseif(!is_numeric($query))
                    $listing->where($query, $values);
                else
                    $listing->whereRaw($values);
            }
        }
        
        if($limit !== null && $limit !== "")
        {
            $listing->limit($limit);
        }

        $listing = $listing->get();

        return $listing;
    }

    /**
    * To get single record by id
    * @param $id
    */
    public static function get($id, $select = [])
    {
        $record = OurTeam::select($select ? $select : ['our_team.*'])
            ->where('id', $id)
            ->with([
                'owner' => function($query) {
                    $query->select([
                            'id',
                            'first_name',
                            'last_name'
                        ]);
                }
            ])
            ->first();

        return $record;
    }

    /**
    * To get single row by conditions
    * @param $where
    * @param $orderBy
    */
    public static function getRow($where = [], $orderBy = 'our_team.id desc', $select = [])
    {
        $record = OurTeam::orderByRaw($orderBy);

        if(!empty($select))
        {
            $record->select($select);
        }
        else
        {
            $record->select([
                'our_team.*'
            ]); 
        }

        foreach($where as $query => $values)
        {
            if(is_array($values))
                $record->whereRaw($query, $values);
            elseif(!is_numeric($query))
                $record->where($query, $values);
            else
                $record->whereRaw($values);
        }
        
        $record = $record->limit(1)->first();

        return $record;
    }

    /**
    * To insert
    * @param $where
    * @param $orderBy
    */
    public static function create($data)
    {
        $team = new OurTeam();

        foreach($data as $k => $v)
        {
            $team->{$k} = $v;
        }

        $team->created_by = AdminAuth::getLoginId();

        if($team->save())
        {
            return $team;
        }
        else
        {
            return null;
        }
    }

    /**
    * To update
    * @param $id
    * @param $where
    */
    public static function modify($id, $data)
    {
        $team = OurTeam::find($id);

        foreach($data as $k => $v)
        {
            $team->{$k} = $v;
        }

        if($team->save())
        {
            return $team;
        }
        else
        {
            return null;
        }
    }

    
    /**
    * To update all
    * @param $id
    * @param $where
    */
    public static function modifyAll($ids, $data)
    {
        if(!empty($ids))
        {
            return OurTeam::whereIn('our_team.id', $ids)
                    ->update($data);
        }
        else
        {
            return null;
        }
    }

    /**
    * To delete
    * @param $id
    */
    public static function remove($id)
    {
        $slider = OurTeam::find($id);
        return $slider->delete();
    }

    /**
    * To delete all
    * @param $id
    * @param $where
    */
    public static function removeAll($ids)
    {
        if(!empty($ids))
        {
            return OurTeam::whereIn('our_team.id', $ids)
                    ->delete();
        }
        else
        {
            return null;
        }
    }

    /**
    * To get count
    * @param $where
    */
    public static function getCount($where = [])
    {
        $record = OurTeam::select([
                DB::raw('COUNT(our_team.id) as count'),
            ]);

        if(!empty($where))
        {
            foreach($where as $query => $values)
            {
                if(is_array($values))
                    $record->whereRaw($query, $values);
                elseif(!is_numeric($query))
                    $record->where($query, $values);
                else
                    $record->whereRaw($values);
            }

            $record = $record->limit(1)->first();
        }

        return $record ? $record->count : '';
    }
}