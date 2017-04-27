
//�A�j���[�V�������x
float AnmTime = 1.0;




// �ϊ��s��
float4x4 WorldViewProjMatrix      : WORLDVIEWPROJECTION;

//
texture LineTex
<
   string ResourceName = "LineTex.png";
>;
texture LineColor
<
   string ResourceName = "LineColor.png";
>;
sampler LineTexSampler = sampler_state
{
   Texture = (LineTex);
   ADDRESSU = WRAP;
   ADDRESSV = WRAP;
	FILTER = LINEAR;
};
sampler LineColorSampler = sampler_state
{
   Texture = (LineColor);
   ADDRESSU = WRAP;
   ADDRESSV = WRAP;
	FILTER = LINEAR;
};


float fTime : TIME;

// ���_�V�F�[�_
struct OutVS
{
	float4 Pos : POSITION;
	float2 Tex : TEXCOORD0;
};

OutVS Test_VS(float4 Pos : POSITION,float2 Tex : TEXCOORD0)
{
	OutVS Out;
    // �J�������_�̃��[���h�r���[�ˉe�ϊ�
    Out.Pos = mul( Pos, WorldViewProjMatrix );
    Out.Tex = Tex;
    return Out;
}

// �s�N�Z���V�F�[�_
float4 Test_PS(OutVS IN) : COLOR
{
	float4 col = tex2D(LineTexSampler,IN.Tex);
	float l = col.r + fTime * AnmTime;
	col = tex2D(LineColorSampler,float2(l,0.5))*col.a;
    return col;
}

// �I�u�W�F�N�g�`��p�e�N�j�b�N
technique MainPass  < string MMDPass = "object";
	    string Script = 
        "RenderColorTarget0=;"
	    "RenderDepthStencilTarget=;"
	    "Pass=DrawObjectBase;"
	    "Pass=DrawObject;"
	    ;
 > {
    pass DrawObject {
        VertexShader = compile vs_2_0 Test_VS();
        PixelShader  = compile ps_2_0 Test_PS();
    }
     pass DrawObjectBase {
     	//MMD�W���`����s��
    }
}
technique MainPass_SS  < string MMDPass = "object_ss"; 	    string Script = 
        "RenderColorTarget0=;"
	    "RenderDepthStencilTarget=;"
	    "Pass=DrawObjectBase;"
	    "Pass=DrawObject;"
	    ;
> {
    pass DrawObject {
        VertexShader = compile vs_2_0 Test_VS();
        PixelShader  = compile ps_2_0 Test_PS();
    }
     pass DrawObjectBase {
     	//MMD�W���`����s��
    }
}
