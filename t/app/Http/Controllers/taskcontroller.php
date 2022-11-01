<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\DB;
use App\Models\courses; 
use App\Models\teacher; 
use App\Models\student;
use App\Models\registration;
use App\Models\course_teacher;
use Validator;
use Session;


use function GuzzleHttp\Promise\all;

class taskcontroller extends Controller
{
    public $successStatus = 200;
   
   
   

    public function login(Request $request){

      // $password=bcrypt($request['password']);
       if(Auth::guard('student')->attempt(['email'=>$request->input('email') ,'password' => $request->input('password')])){
        
        

        return response()->json($this-> successStatus); 
    }

  
    return response()->json(['error'], 401); 

    }


    public function add_course(Request $request) 
    {      
        $validator = Validator::make($request->all(), [ 
          
            'name' => 'required', 
            
        ]);

          if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }

           $input = $request->all(); 

            $course = courses::create($input); 
       
        $success['token'] = $course->createToken('MyApp')-> accessToken; 
        $success['name'] =  $course->name;

return response()->json( $this-> successStatus); 
    }

    public function add_teacher(Request $request) 
    {      
        $validator = Validator::make($request->all(), [ 
          
            'name' => 'required', 
            
        ]);

          if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }

           $input = $request->all(); 

            $teacher = teacher::create($input); 
       
        $success['token'] = $teacher->createToken('MyApp')-> accessToken; 
        $success['name'] =  $teacher->name;

return response()->json( $this-> successStatus); 
    }
    public function add_course_teacher(Request $request) 
    {      
        $validator = Validator::make($request->all(), [ 
          
            'name_course' => 'required',
            'name_teacher' => 'required', 
            
        ]);

          if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
        $name_course= $request->name_course;
        $name_teacher= $request->name_teacher;

        $sql= DB::select('select id from courses where name=?',[$name_course]);
        $sql2= DB::select('select id from teacher where name=?',[$name_teacher]);
        
         $data['sql1']=$sql[0]->id;
        $data['sql2']=$sql2[0]->id;

           course_teacher::create([
                "id_course" => $data['sql1'],
                "id_teacher"=> $data['sql2']
            ]); 
           

return response()->json( $this-> successStatus); 
    }

    public function add_student(Request $request) 
    {      
        $validator = Validator::make($request->all(), [ 
          
            'name' => 'required', 
            
        ]);

          if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }

          $pass=bcrypt($request['password']);

            $student = student::create([
                "name" =>$request->name,
                "email"=>$request->email,
                "password"=>$pass
            ]); 
       
        $success['token'] = $student->createToken('MyApp')-> accessToken; 
        $success['name'] =  $student->name;

return response()->json( $success,$this-> successStatus); 
    }


    public function register(Request $request) 
    {      
        $validator = Validator::make($request->all(), [ 
          
            
            'name_course' => 'required',
            'name_teacher' => 'required', 
            
        ]);

          if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
        $name_course= $request->name_course;
        $name_teacher= $request->name_teacher;

        $sql= DB::select('select id from courses where name=?',[$name_course]);
        $sql2= DB::select('select id from teacher where name=?',[$name_teacher]);
        
         $data['sql1']=$sql[0]->id;
        $data['sql2']=$sql2[0]->id;

        $sql3=DB::select("select id from course_teacher where id_course='{$data['sql1']}' and id_teacher='{$data['sql2']}'");

        registration::create([
            "id_student" =>$request->id_student,
            "id_course_teacher"=>$sql3[0]->id
        ]); 
           

return response()->json( $this-> successStatus); 
    }
    

    public function view_register() 
    { 
      //$success[0]->id_student 
        $success=registration::all();
        $data;
        for ($x = 0; $x <count($success); $x++){
            $id_student=$success[$x]->id_student;
            $id_course_teacher=$success[$x]->id_course_teacher;

            $sql1=DB::select('select name from student where id=?',[$id_student]);
            $sql2=DB::select('select id_course,id_teacher from course_teacher where id=?',[$id_course_teacher]);
            $sql3=DB::select('select name from courses where id=?',[$sql2[0]->id_course]);
            $sql4=DB::select('select name from teacher where id=?',[$sql2[0]->id_teacher]);

            $data[$x]['id']=$success[$x]->id;
            $data[$x]['name_student']=$sql1[0]->name;
            $data[$x]['name_course']=$sql3[0]->name;
            $data[$x]['name_teacher']=$sql4[0]->name;

        }
        
       return response()->json($data,$this-> successStatus);
 
    }





    public function update(Request $request) 
    { 
        $id=$request->id;
        $name_course= $request->name_course;
        $name_teacher= $request->name_teacher;
        $success=registration::find($id);

        $id_student=$success["id_student"];

        $success->delete();

       $sql= DB::select('select id from courses where name=?',[$name_course]);
        $sql2= DB::select('select id from teacher where name=?',[$name_teacher]);
        
         $data['sql1']=$sql[0]->id;
        $data['sql2']=$sql2[0]->id;

        $sql3=DB::select("select id from course_teacher where id_course='{$data['sql1']}' and id_teacher='{$data['sql2']}'");

        registration::create([
            "id_student" => $id_student,
            "id_course_teacher"=>$sql3[0]->id
        ]); 
        return response()->json($this-> successStatus);

    }

}
