using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Routate : MonoBehaviour
{
    public Vector3 rotationSpeed = new Vector3(0, 1, 0);

    private void Update()
    {
        transform.Rotate(rotationSpeed * Time.deltaTime);
    }
}
