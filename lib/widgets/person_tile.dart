import 'package:flutter/material.dart';
import '../models/person.dart';

class PersonTile extends StatelessWidget {
  final Person person;
  final VoidCallback onDelete;

  const PersonTile({
    super.key,
    required this.person,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // Colors chosen to resemble the screenshot
    const tileGreen = Color(0xFF4CAF50); // base green
    const nameColor = Color(0xFF2F5D3C); // darker name color
    const subjectColor = Color(0xFF083927); // subtitle color

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: tileGreen,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // left image with rounded corners
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 66,
                  height: 66,
                  child: Image.network(
                    person.imageUrl,
                    width: 66,
                    height: 66,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 66,
                      height: 66,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.person, size: 36),
                    ),
                  ),
                ),
              ),
            ),

            // name + subjects
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      person.fullName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: nameColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Subjects: [${person.subjects.join(', ')}]',
                      style: const TextStyle(
                        fontSize: 13,
                        color: subjectColor,
                        height: 1.25,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),

            // minus icon button on right
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.remove,
                  size: 28,
                  // dark color so it is visible on green
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
