from __future__ import unicode_literals

from django.http.response import HttpResponse, HttpResponseBadRequest
from django.views.decorators.csrf import csrf_exempt
#from zinnia.models.entry import Entry

from wechat_sdk import WechatBasic
from wechat_sdk.exceptions import ParseError
from wechat_sdk.messages import TextMessage, VoiceMessage, ImageMessage, VideoMessage, LinkMessage, LocationMessage,EventMessage
# from demo.settings import WECHAT_TOKEN, WEIXIN_APPID, WEIXIN_APPSECRET

#首图的URL 900*500
# BIGIMAGE_URL = r'http://7xoa4z.com/blog%2Fweixin%2Fhzw200%2F1.jpg'
#小图的URL 200*200
#SMALLIMAGE_URL = r'http://7xoa4z.com/blog%2Fweixin%2Fshuotu.jpg'

wechat_instance = WechatBasic(
    token='aabbcc',
    appid='wx8c038273d0a6dd79',
    appsecret='82cc3ad47ded78efad162b0f33a59695'
)

def index(request):
    return HttpResponse('<h2>Index Page!</h4>')

@csrf_exempt
def weixin(request):
    if request.method == 'GET':
        # 检验合法性
        # 从 request 中提取基本信息 (signature, timestamp, nonce, xml)
        signature = request.GET.get('signature')
        timestamp = request.GET.get('timestamp')
        nonce = request.GET.get('nonce')

        if not wechat_instance.check_signature(signature=signature,timestamp=timestamp,nonce=nonce):
            return HttpResponseBadRequest('Verify Failed')
        
        return HttpResponse(request.GET.get('echostr', ''), content_type="text/plain")

    # 解析本次请求的 XML 数据
    try:
        wechat_instance.parse_data(data=request.body)
    except ParseError:
        return HttpResponseBadRequest('Invalid XML Data')

    # 获取解析好的微信请求信息
    message = wechat_instance.get_message()
    
    if isinstance(message, TextMessage):
        # 当前会话内容
        content = message.content.strip()
        reply_text = '发送的内容是：'+content
    elif isinstance(message, VoiceMessage):
        reply_text = '语音信息我听不懂/:P-(/:P-(/:P-('
    elif isinstance(message, ImageMessage):
        reply_text = '图片信息我也看不懂/:P-(/:P-(/:P-('
    elif isinstance(message, VideoMessage):
        reply_text = '视频我不会看/:P-('
    elif isinstance(message, LinkMessage):
        reply_text = '链接信息'
    elif isinstance(message, LocationMessage):
        reply_text = '地理位置信息'+message.label.strip()
    elif isinstance(message, EventMessage):
        if message.type == 'subscribe':
            reply_text = '感谢您的到来!回复“功能”返回使用指南'
            # if message.key and message.ticket:
                #     reply_text += '\n来源：二维码扫描'
                # else:
                #     reply_text += '\n来源：搜索公众号名称'
        elif message.type == 'unsubscribe':
            reply_text = '取消关注事件'
        elif message.type == 'scan':
            reply_text = '已关注用户扫描二维码！'
        elif message.type == 'location':
            reply_text = '上报地理位置'
        elif message.type == 'click':
            reply_text = '自定义菜单点击'
        elif message.type == 'view':
            reply_text = '自定义菜单跳转链接'
        elif message.type == 'templatesendjobfinish':
            reply_text = '模板消息'
        else:
            reply_text = '功能还没有实现'

    response = wechat_instance.response_text(content=reply_text)
    return HttpResponse(response, content_type="application/xml")
#    print(request.GET.get('signature','no'))
#    return HttpResponse(request.GET.get('echostr',''))

def getuser(request):
    user = wechat_instance.get_user_info('o3T7bwbhRKxsi2EsvFHSTXKzZgPM', lang='zh_CN')
    print(user)
    return HttpResponse(user, content_type="text/plain")

def cmenu(request):
    menu = {
     'button':[
        {
            'type': 'click',
            'name': '今日歌曲',
            'key': 'V1001_TODAY_MUSIC'
        },
        {
            'type': 'click',
            'name': '歌手简介',
            'key': 'V1001_TODAY_SINGER'
        },
        {
            'name': '菜单',
            'sub_button': [
                {
                    'type': 'view',
                    'name': '搜索',
                    'url': 'http://www.soso.com/'
                },
                {
                    'type': 'scancode_push',
                    'name': '扫一扫',
                    "key": "rselfmenu_0_1", 
                    "sub_button": [ ]
                },

            ]
        }
      ]
    }
    res = wechat_instance.create_menu(menu)
    print(res)
    return HttpResponse('ok')
