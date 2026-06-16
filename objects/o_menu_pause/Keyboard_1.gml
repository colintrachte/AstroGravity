if (ready)
{
    if keyboard_check(vk_enter)
    {
        game_end()
    }
    else
    {
        instance_destroy();
    }
}

