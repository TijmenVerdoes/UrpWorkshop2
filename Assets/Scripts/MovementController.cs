using UnityEngine;

public class CharacterMovement : MonoBehaviour
{
    public float speed = 5.0f;
    public float sensitivity = 2.0f;

    private CharacterController controller;
    private float rotX;
    private float rotY;

    private void Start()
    {
        controller = GetComponent<CharacterController>();
        Cursor.lockState = CursorLockMode.Locked;
    }

    private void Update()
    {
        // Player Movement
        var moveFB = Input.GetAxis("Vertical") * speed * Time.deltaTime;
        var moveLR = Input.GetAxis("Horizontal") * speed * Time.deltaTime;

        var movement = transform.forward * moveFB + transform.right * moveLR;

        controller.Move(movement);

        // Player Rotation with Mouse
        rotX += Input.GetAxis("Mouse X") * sensitivity;
        rotY -= Input.GetAxis("Mouse Y") * sensitivity;
        rotY = Mathf.Clamp(rotY, -90f, 90f);

        transform.rotation = Quaternion.Euler(0, rotX, 0);
        Camera.main.transform.localRotation = Quaternion.Euler(rotY, 0, 0);
    }
}