Shader "Unlit/workshopShader"
{
  Properties
 {
     // Definieert de Properties van de shader die kunnen worden aangepast in de unity.
  _MainTexture("Texture", 2D) = "white"{}
  _Color("Color", Color) =(1,1,1,1)
 }
  SubShader
  {
      Pass
      {
          CGPROGRAM
          // Specificeert welke functies moeten worden gebruikt voor de vertex- en fragmentverwerking. Je moet functions definiëren.
          #pragma vertex vertexFunc
          #pragma fragment fragmentFunc
          // is voor de GPU
          #include "UnityCG.cginc"

          // Definieert de structuur voor de gegevens van de vertex shader.
          struct appdata
          {
              float4 vertex : POSITION; // Positie van de vertex
              float2 uv : TEXCOORD0;  // UV coordinaten van de texture
          };
          // Vertex naar fragment
          struct v2f
          {
              float4 postion : SV_POSITION; // Positie van het vertex in clip space
              float2 uv: TEXCOORD0; // Doorgegeven UV coordinaten voor texture
          };

          fixed4 _Color;   // Zodat we ze kunnen gebruiken
          sampler2D _MainTexture; // Zodat we ze kunnen gebruiken.

          v2f vertexFunc(appdata IN)
          {
              v2f OUT;
              OUT.postion = UnityObjectToClipPos(IN.vertex); // Omzetten van vertex positie naar clip space
              OUT.uv = IN.uv; // Doorgeven van de UV coordinaten
              return OUT;
          }

          fixed4 fragmentFunc(v2f In): SV_Target{
              fixed4 pixelColor = tex2D(_MainTexture, In.uv); // texture kleur opgehaald op de gegeven uv coordinaten

              return pixelColor * _Color; 
          }
          ENDCG
      }
  }
  
}
