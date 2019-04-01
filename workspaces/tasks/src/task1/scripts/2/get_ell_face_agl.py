import numpy as np

def get_ell_face_agl(dpts, agls):
    """
    Get angle that is perpendicular to the face of the ellipse

    Args:
        dpts : Array[np.float64] -- depths measurements around ellipse center
        agls : Array[np.float64] -- angles corresponding to the depth measurements

    Returns:
        np.float64 -- angle that is perpendicular to the ellipse face
        np.float64 -- y intercept of the line that is perpendicular to the ellipse face
    """

    # Get x and y values of depth points.
    x_vals = np.cos(agls)*dpts
    y_vals = np.sin(agls)*dpts

    # interpolate line using least squares.
    k, m = np.linalg.lstsq(np.vstack((x_vals, np.ones(x_vals.shape[0]))).T, y_vals, rcond=None)[0]

    # Return angle of perpendicular line.
    return np.arctan(-1/k), m
    