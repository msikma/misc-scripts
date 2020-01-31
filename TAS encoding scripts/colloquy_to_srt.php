<?php

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Convert Colloquy transcript to SubRip subtitle text file (.srt) *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Copyright (C) 2012, Dada from TASVideos. Public domain.         */


/* Which input file do we extract data from? */
define('INPUT_FILE',        'Lil_Gecko.colloquyTranscript');

/* How long should each chat line appear on the screen? */
define('SUB_DURATION',      5);

/* To which format should we export? (Only one option; expand later.) */
/* Possible values: subrip. */
define('EXPORT_FORMAT',     'subrip');


$transcript = simplexml_load_file(INPUT_FILE);
$attributes = $transcript->attributes();

/* The "began" attribute is used for the calculation of timestamps. */
$transcript_info = array(
    'began' => strtotime((string)$attributes['began']),
    'source' => (string)$attributes['source'],
);

/* First, we're going to extract the data into a plain PHP array.
   Then we'll convert the data to SRT format. */
$messages = array();

foreach ($transcript->children() as $envelope) {
    /* An envelope can contain multiple messages by one sender: */
    /* <envelope>
         <sender> [...] </sender>
         <message> [...] </message>
         <message> [...] </message>
         (etc.)
       </envelope> */
    
    $sender = array();
    $envelope_messages = array();
    foreach ($envelope->children() as $item) {
        $name = $item->getName();
        $attributes = $item->attributes();
        if ($name == 'sender') {
            $sender = array(
                'hostmask' => (string)$attributes['hostmask'],
                'nickname' => (string)$item,
            );
        }
        if ($name == 'message') {
            $envelope_messages[strtotime((string)$attributes['received']) - $transcript_info['began']] = array(
                'id' => (string)$attributes['id'],
                'text' => trim((string)$item),
            );
        }
    }
    foreach ($envelope_messages as $rel_time => $message) {
        $messages[] = array(
            'time' => $rel_time,
            'time_formatted' => format_time($rel_time),
            'sender' => $sender,
            'message' => $message,
        );
    }
}

/* Save output to buffer. */
ob_start();
switch (EXPORT_FORMAT) {
    case 'subrip':
        $n = 0;
        foreach ($messages as $message) {
            $t_st = $message['time_formatted'];
            $msg = $message['sender']['nickname'].': '.$message['message']['text'];
            printf("%d\n%s\n%s\n\n",
                ++$n,   /* Sequential ID of message. */
                $t_st,  /* Timestamp, e.g. 00:00:24,600 --> 00:00:27,800. */
                $msg    /* Author nickname plus message body. */
            );
        }
        break;
}
/* We now have the whole subtitle file. */
$subtitle_file_contents = ob_get_clean();

/* For now, just print it. */
print($subtitle_file_contents);


function format_time($start, $end=null)
{
    if (!isset($end)) {
        $end = $start + SUB_DURATION;
    }
    $times = array();
    foreach (array($start, $end) as $t) {
        $h = $t / 3600 << 0;
        $m = ($t - ($h * 3600)) / 60 << 0;
        $s = ($t - ($h * 3600) - ($m * 60)) << 0;
        $times[] = sprintf('%02d:%02d:%02d,%03d', $h, $m, $s, 0);
    }
    return $times[0].' --> '.$times[1];
}
