<?php

namespace App\Http\Controllers;

use App\Http\Requests\SpecialtyFormRequest;
use App\Specialty;
use Auth;

use Illuminate\Http\Request;
use View;
use Redirect;
use Validator;

class SpecialtyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        //get all specialties
        $spec = Specialty::all();

        //load the view and pass the specs 
        return View::make('specialty.index')->with('specialty', $spec);        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
    	$specialty = Specialty::all();
        return view('specialty.create', compact('specialty'));        
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        //get the specialty
        $spec = Specialty::find($id);


        //show the view and pass the specialty
        return view('specialty.show')->with('specialty', $spec);
    }

    public function showAll(){
        $spec = Specialty::all();

        return view('specialty.show')->with('specialty', $spec);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(SpecialtyFormRequest $request)
    {

        
        //adicionar validação aqui
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:10',
            'area' => 'required|max:30',
            ]);
        // if ($validator->fails()) {
        //     return redirect('specialty/create')
        //                 ->withErrors($validator)
        //                 ->withInput();
        // }



        $specialty = $request->all();
        Specialty::create($specialty);
        return redirect()->route('specialty.index', compact('specialty'));
        
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        $specialty = Specialty::find($id);
        return view('specialty.edit')->with('specialty', $specialty);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(SpecialtyFormRequest $request, $id)
    {
        //dicionar validação aqui
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:10',
            'area' => 'required|max:30',
            ]);
        // if ($validator->fails()) {
        //     return redirect('specialty/create')
        //                 ->withErrors($validator)
        //                 ->withInput();
        // }
        $specialty = Specialty::findOrFail($id);
        $specialty->fill($request->all());
        $specialty->save();
        //Specialty::create($specialty);
        return redirect()->route('specialty.index', compact('specialty'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
        $specialty = Specialty::find($id);
        $specialty->delete();

        //redirect
        Session::flash('message', 'Sucessfully deleted');
        return redirect('specialty');
    }
}
