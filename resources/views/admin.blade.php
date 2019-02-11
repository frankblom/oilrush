@extends('layouts.admin')

@section('content')
	<div id="scoreList">
	@foreach($score as $i => $s)
		<div class="scoreItem">
			<b>{{$i+1}}</b><img src="{{$s->flag}}" class="score-flag">{{$s->name}} <span>{{$s->amount}} L</span>
		</div>
	@endforeach
	</div>
	<div id="adminPanel">
		<form id="buttonSection" method="post" accept="/">
			{{ csrf_field() }}
			<button type="submit" class="btn btn-lg btn-danger" name="action" value="END">END</button>
			<button type="submit" class="btn btn-lg btn-default" name="action"  value="random">Random</button>
			<button type="submit" class="btn btn-lg btn-default">Refresh</button>
		</form>
		<form id="SourceSection" method="post" accept="/">
			{{ csrf_field() }}
			<div id="sources">
			@foreach($sources as $s)
			<div class="sourceblock">
				<input type="text" value="{{$s->lpm}}" name="{{$s->id}}">
				<p><b>{{$s->number}}</b> {{$s->title}}</p>
				@if($s->owner == null)
					<p class="source-owner"></p>
				@else
					<p class="source-owner">
						<img src="{{$s->owner->flag}}" class="owner-flag">
						<span>{{$s->owner->name}}</span>
					</p>
				@endif
			</div>
		@endforeach	
		</div>
		<button type="submit" name="action" value="update" class="btn btn-primary btn-lg">Update</button>
		<form>
	</div>
@endsection
