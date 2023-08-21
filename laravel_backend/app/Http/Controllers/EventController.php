<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\Transaction;

class EventController extends Controller
{
    public function index() {
        $event = Event::all();

        return response()->json($event, 200);
    }

    public function show(Request $request) {
        $event = Event::find($request->event_id);

        return $event;
    }

    public function transaction(Request $request) {
        $eventCount = Transaction::count() + 1;

        $transactionId = sprintf("TSC-%03d", $eventCount);

        Transaction::insert([
            'id' => $transactionId,
            'event_id' => $request->id,
            'verification_code' => base64_encode($transactionId),
        ]);

        return response()->json(base64_encode($transactionId), 200);
    }

    public function verify(Request $request) {
        $transaction = Transaction::where([
            ['event_id', '=', $request->event_id],
            ['verification_code', '=', $request->code],
        ])->get();

        return $transaction;

        if ($transaction->count() == 0) {
            return response()->json(['message' => 'Failed'], 400);
        }

        return response()->json($transaction, 200);
    }
}
