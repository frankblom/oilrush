<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="refresh" content="10">
    <title>{{ config('app.name', 'Laravel') }}</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Styles -->
    <link href="{{ asset('css/press.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        <div id="score">
            @foreach($countries as $i => $c)
            <div class="score-item">
                <div class="country">
                    <span>{{$i+1}}</span>
                    <img src="{{$c->flag}}">
                    <p>{{$c->name}}</p>
                </div>
                <div class="score">
                    <div class="score-bar" style="width:{{($c->amount / $top) * 100}}%;">
                        <span>{{(int)$c->amount}} L</span>
                    </div>
                </div>

            </div>
            @endforeach
        </div>
        
    </div>
</body>
</html>
