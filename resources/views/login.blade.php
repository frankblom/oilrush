@extends('layouts.app')

@section('content')
    <form method="post" accept="/" id="login">
        {{ csrf_field() }}
        <div class="form-group">
            <img src="img/logo.png">
        </div>
        <div class="form-group">
            <input type="text" class="form-control input-lg" name="code" placeholder="please enter your code">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-block btn-lg btn-gray" id="submit">Submit</button>
        </div>
        @if (session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif
    </form>
@endsection
