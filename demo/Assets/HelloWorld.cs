using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HelloWorld : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    void OnGUI() {
        // GUI.Button(new Rect(Screen.width / 2 - 100, 20, 200, 30), "登录");
        // GUI.Button(new Rect(Screen.width / 2 - 100, 70, 200, 30), "广告");
    }

    public void Click()
    {
        Debug.Log("点击了登录按钮");
    }
}
