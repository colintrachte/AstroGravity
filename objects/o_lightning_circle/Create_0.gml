spin=choose(1,-1)
hp=0;
segments=30;

weighting=0;
update_speed=2+random(2);
for (var i=0;i<4;i+=1)
{
    path[i]=path_add();
    path_set_kind(path[i],1);
    path_set_closed(path[i],1);
}
path_set_closed(path[1],0);
alarm[0]=2;

