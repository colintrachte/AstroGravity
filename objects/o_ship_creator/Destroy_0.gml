ds_list_destroy(points_list)
ds_grid_destroy(ship_grid)
if instance_exists(music_demo)
{
    with music_demo
    {
        fluteenabled=1;
        toneenabled=1;
        patternenabled=1;
    }
}

