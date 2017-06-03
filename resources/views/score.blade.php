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
            @foreach($countries as $c)
            <div class="score-item">
                <div class="score" >
                    <div class="score-bar" style="height:{{($c->amount / $top) * 100}}%;">
                        <span>{{(int)$c->amount}} L</span>
                    </div>
                </div>
                <div class="country">
                    <div class="country-flag">
                        <img src="{{$c->flag}}">
                    </div>
                    <p>{{$c->name}}</p>
                </div>

            </div>
            @endforeach
        </div>
        
    </div>
</body>
</html>
