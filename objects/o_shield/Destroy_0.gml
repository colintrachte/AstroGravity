/// @description delete paths to prevent memory leak
for (var j=0;j<layers;j+=1)
{
    path_delete(path[j])
    path_delete(path2[j])
}

