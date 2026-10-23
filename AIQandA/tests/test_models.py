import pytest
from AIQandA.models import Conversation, Message
from django.contrib.auth.models import User


@pytest.mark.django_db
def test_conversation_message_relationship():
    user = User.objects.create_user(username="stu", password="pass")
    conv = Conversation.objects.create(user=user, title="梯度下降")
    Message.objects.create(conversation=conv, role="user", content="为什么学习率大会震荡？")
    Message.objects.create(conversation=conv, role="assistant", content="因为参数更新步长过大……")
    assert conv.messages.count() == 2
