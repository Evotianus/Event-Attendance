<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Carbon\Carbon;
use App\Models\Event;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        Event::truncate();

        $eventList = [
            [
                'id' => 'EVT-001',
                'title' => 'Halloween Event Party',
                'content' => "One theory holds that many Halloween traditions were influenced by Cietic harvest festivals particularly the Halloween's origins can be traced back to the ancient Celtic festival known as Samhain, which was held on November 1 in contemporary calendars. It was believed that on that day, the souls of the dead returned to their homes, so people dressed in costumes and lit bonfires to ward off spirits.",
                'image' => 'https://images.unsplash.com/photo-1572860177022-8fda92a90c95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                'location' => 'Indonesia',
                'date' => Carbon::parse('2023-10-30'),
                'time' => Carbon::parse('20:30:00'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];

        Event::insert($eventList);
    }
}
