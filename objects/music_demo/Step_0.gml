sec=delta_time/1000000;
alarm0+=sec;
alarm1+=sec;
alarm2+=sec;
if (alarm0>=2)
{
    alarm0=0;//the trick is to time your alarms to match the length of the audio clips
    
    if (beat)
    {
        audio_play_sound(snd_beat,0,false)
    }

    if (bass)
    {
        audio_play_sound(snd_bass,1,false)
    }

    if (flute)
    {
        audio_play_sound(snd_flute,2,false)
        flute=choose(1,0);
    }
    else
    {
        if choose(0,patternenabled)
        {
            audio_play_sound(choose(snd_pattern1,snd_pattern2),3,false)
        }
        if choose(0,fluteenabled)
        {
            flute=1;//if enabled, the flute will play right after the rattle
            audio_play_sound(snd_rattle,4,false)
        }
    }
}
if (alarm1>=4)//the trick is to time your alarms to match the length of the audio clips
{
    alarm1=0;
    
    if (string1)
    {
        audio_play_sound(snd_string1,4,false)
    }
    else
    {
        string1=choose(0,stringenabled);
        string2=choose(0,stringenabled*flute);//string2 might play only if flute is also playing.
    }

    if (string2)
    {
        audio_play_sound(snd_string2,5,false)
    }
}

if (alarm2>=.5)
{
    alarm2=0;
    //this sound is special because it is triggered by the user.
    //There is 1/2 second between beats.
    //when you click the mouse, the sound plays as soon as possible without breaking rhythm.
    if (snare)
    {
        audio_play_sound(snd_snare,6,false)//snare drum is triggered by your left mouse click (see event)
    }
    snare=0;
}

