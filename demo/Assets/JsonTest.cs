using System;
using System.IO;
using System.Text;
using UnityEngine;
using System.Collections.Generic;

public class JsonStr
{

    public string code = string.Empty;
    public string id = string.Empty;
    public string profit = string.Empty;
    public string amount = string.Empty;
    public string type = string.Empty;
    public string message = string.Empty;
    public string[] strAll = new string[6];








    /// <summary>
    ///六个字段都存进去 用哪个 strAll[几]
    ///0code 1id 2profit 3amount 4type 5message
    /// </summary>
    public void SaveString()
    {
        strAll[0] = (code);
        strAll[1] = (id);
        if (profit != null)
        {
            strAll[2] = (profit);
        }

        strAll[3] = (amount);
        strAll[4] = (type);
        strAll[5] = (message);
    }
}

public static class JsonTest
{
    

    //private void Start ()
    //{
    //    ReadJson();
    //}
    //static  string CreatJson1 ()
    //  {
    //      JsonStr jsonIns = new JsonStr();
    //      jsonIns.amount = "我是amount";
    //      jsonIns.code = "我是code";
    //      jsonIns.id = "我是id";
    //      //jsonIns.profit = "我是profit";
    //      jsonIns.type = "我是type";
    //      jsonIns.message = "我是message";
    //      string jsonString = JsonUtility.ToJson(jsonIns);
    //      return jsonString;
    //  }
    //  static string CreatJson2 ()
    //  {
    //      string jsonTest = Resources.Load<TextAsset>("Jsonn").text;
    //      return jsonTest;
    //  }
    //  static void ReadJson ()
    //  {
    //      //string jsonString = CreatJson1();
    //      string jsonString = CreatJson2();
    //      JsonStr jsonText = JsonUtility.FromJson<JsonStr>(jsonString);
    //      jsonText.SaveString();
    //      foreach (var item in jsonText.strAll)
    //      {
    //          Debug.Log(item.ToString());
    //      }
    //  }
    /// <summary>
    /// 要传入的json字符串
    /// </summary>
    /// <param name="_jsonString"></param>
    /// <returns></returns>
    public static JsonStr ReadJsonGet(string _jsonString)
    {
        JsonStr jsonText = JsonUtility.FromJson<JsonStr>(_jsonString);//实例化数据类 并存入json字符串内容
        jsonText.SaveString();
        foreach (var item in jsonText.strAll)
        {
            Debug.LogError(item.ToString());
        }
        return jsonText;
    }












    /// <summary>
    ///0code 1id 2profit 3amount 4type 5message
    ///要读取的json字符串
    /// </summary>
    /// <param name="_whichData"></param>
    /// <param name="_jsonString"></param>
    public static void GetWhichData(byte _whichData, string _jsonString)
    {
        JsonStr jsonText = ReadJsonGet(_jsonString);


        short id = short.Parse(jsonText.strAll[_whichData]);
    }
    //要调用id
    //GetWhichData(1,某json字符串);
}