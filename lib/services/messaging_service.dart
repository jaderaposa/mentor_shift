class MessagingService {
  String generateConversationId(String userId1, String userId2) {
    List<String> participants = [userId1, userId2];
    participants.sort(); // Sort participants to ensure consistency
    // Concatenate the sorted user IDs to form a consistent conversationId
    String conversationId = participants.join('_');
    print(
        'generateConversationId called with userId1: $userId1, userId2: $userId2');
    return conversationId;
  }
}
