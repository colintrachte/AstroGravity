//see alarm 4 for intermittent code
image_angle+=spin*screen.sec;

if (galaxy_id>0)
{
    orbit_angle+=galaxy_id.spin;
    math_orbit(galaxy_id.x,galaxy_id.y,orbit_radius,orbit_angle)
}

if in_view
{
    if (segments<7)
    {
        //this code determines the radius of the glow around the star when zoomed out
        dist=point_distance(x,y,mouse_x,mouse_y);
        dt=(1-(dist/(32*camera.zoom)))*(dist<(32*camera.zoom));
    }
}

