@extends('layouts.app')

@section('content')
	<div id="sourceInfo">
        <h1><img src="{{$country->flag}}"> {{$country->name}}</h1>
        <p>{{(int)$score}} <span>Liter</span></p>
    </div>
	<table id="sourceList">
		@foreach($sources as $s)
			<tr class="source-item" id="{{$s->id}}">
				<td class="source-number">{{$s->number}}</td>
				<td class="source-title">{{$s->title}}</td>
				<td class="source-lpm">
					<span class="lpm-val">{{$s->lpm}}</span>
					<span class="lpm-lbl">LPM</span>
				</td>
				@if($s->owner == null)
					<td class="source-owner"></td>
				@else
					<td class="source-owner">
						<img src="{{$s->owner->flag}}" class="owner-flag">
						<span>{{$s->owner->name}}</span>
					</td>
				@endif
			</tr>
		@endforeach
	</table>
@endsection
