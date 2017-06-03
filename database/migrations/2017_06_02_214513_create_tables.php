<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('countries')) {
            Schema::create('countries', function (Blueprint $t) {
                $t->increments('id');
                $t->string('name', 20);
                $t->string('flag');
                $t->string('code', 10);
            });
        }

        if (!Schema::hasTable('sources')) {
            Schema::create('sources', function (Blueprint $t) {
                $t->increments('id');
                $t->string('title', 20);
                $t->integer('owner')->nullable();
                $t->integer('lpm')->defaults(100);
                $t->string('code', 10);
            });
        }

        if (!Schema::hasTable('oil')) {
            Schema::create('oil', function (Blueprint $t) {
                $t->increments('id');
                $t->integer('country_id');
                $t->integer('source_id');
                $t->integer('lpm');
                $t->timestamp('start');
                $t->timestamp('end')->nullable();
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('oil');
        Schema::dropIfExists('source');
        Schema::dropIfExists('countries');
    }
}
