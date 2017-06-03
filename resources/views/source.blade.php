@extends('layouts.app')

@section('content')
    <div id="sourceInfo">
        <h1>{{$source->title}}</h1>
        <p>{{$source->lpm}} <span>LPM</span></p>
    </div>
    <div id="ownerList">
        <form method="post" >
         {{ csrf_field() }}
        @foreach($countries as $c)
            <label class="country">
                <div class="country-image">
                    <img src="{{$c->flag}}">
                </div>
                <p>{{$c->name}}</p>
                @if($source->owner_id == $c->id)
                    <input type="radio" name="country" value="{{$c->id}}" checked>
                @else
                    <input type="radio" name="country" value="{{$c->id}}">
                @endif
            </label>
        @endforeach
        <button type="submit" class="btn btn-block btn-primary btn-lg">Save</button>
        </form>
    </div>
@endsection
