import 'package:flutter/material.dart';
import 'package:archiverse/models/work.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

/// Utility class for handling work ratings visualization
class RatingUtils {
  // Age Rating Information
  static RatingInfo getAgeRatingInfo(BuildContext context, AgeRating? rating) {
    switch (rating) {
      case AgeRating.GENERAL:
        return RatingInfo(
          symbol: "G",
          label: "General Audiences",
          description:
              "This work is appropriate for all ages with no adult themes or potentially offensive content.",
          information:
              "General Audiences content is suitable for everyone, including younger readers. These works avoid adult themes, explicit language, violence, or sexual content. They're comparable to G or PG rated films.\n\nThese works typically focus on themes like friendship, adventure, mild drama, or humor without elements that would be concerning for parents or young readers.\n\nReaders of any age can safely enjoy General Audiences works without encountering mature or potentially disturbing content.",
          backgroundColor: Colors.green.withOpacity(0.8),
          foregroundColor: Colors.white,
          icon: TablerIcons.circle_check,
        );
      case AgeRating.TEEN:
        return RatingInfo(
          symbol: "T",
          label: "Teen And Up",
          description:
              "This work may contain mild violence, coarse language, and minor suggestive adult themes.",
          information:
              "Teen And Up content is appropriate for teenagers and older readers, similar to PG-13 rated films or T-rated video games.\n\nThese works may include:\n• Mild to moderate violence\n• Some coarse language\n• Mild suggestive themes\n• Non-explicit romantic situations\n• Mild substance references\n• Some mature themes\n\nWhile these works avoid explicit content, they may address more complex or mature themes than General Audiences works. Parents might want to review Teen rated works before recommending them to younger teenagers.",
          backgroundColor: Colors.orange.withOpacity(0.8),
          foregroundColor: Colors.white,
          icon: TablerIcons.circle_letter_t,
        );
      case AgeRating.MATURE:
        return RatingInfo(
          symbol: "M",
          label: "Mature",
          description:
              "This work contains adult themes including violence, sensitive topics, or non-explicit sexual content.",
          information:
              "Mature content is intended for adult readers and may not be suitable for people under 17, comparable to R-rated films or M-rated video games.\n\nThese works may include:\n• Strong violence or detailed injury descriptions\n• Frequent coarse language\n• Moderate sexual content (not explicit)\n• Substance use\n• Complex psychological themes\n• Challenging social issues\n\nMature works handle adult themes and situations with more intensity than Teen works but stop short of explicit sexual content. They often explore complex moral questions, difficult relationships, or darker themes that require mature understanding.",
          backgroundColor: Colors.deepOrange.withOpacity(0.8),
          foregroundColor: Colors.white,
          icon: TablerIcons.circle_letter_m,
        );
      case AgeRating.EXPLICIT:
        return RatingInfo(
          symbol: "E",
          label: "Explicit",
          description:
              "This work contains explicit sexual content, graphic violence, or other adult material.",
          information:
              "Explicit content is strictly for adult readers age 18+. These works contain content not suitable for minors under any circumstances.\n\nExplicit works typically include:\n• Explicit sexual content with detailed descriptions\n• Potentially disturbing graphic violence\n• Very adult themes and situations\n• Content that would receive NC-17 or stronger ratings in film\n\nThis rating indicates the highest level of mature content. While not all Explicit works contain all these elements, the rating serves as a clear boundary for content intended only for mature adults. Authors use this rating when their work includes detailed sexual scenes or extremely graphic content.",
          backgroundColor: Colors.red.withOpacity(0.8),
          foregroundColor: Colors.white,
          icon: TablerIcons.circle_letter_e,
        );
      default:
        return RatingInfo(
          symbol: "N",
          label: "Not Rated",
          description:
              "The author hasn't specified the content rating. May contain material from any rating category.",
          information:
              "When a work is Not Rated, the author has not provided specific guidance about the content's appropriateness for different age groups.\n\nImportant considerations:\n• These works could potentially contain content from any rating category\n• There may be unexpected mature elements without warning\n• Readers should approach with caution, especially younger readers or those sensitive to certain content\n• The lack of rating doesn't necessarily mean inappropriate content, but indicates uncertainty\n\nIf you have specific content concerns, you may want to check the work's tags or comments for more information before reading. When in doubt, assume that unrated works could contain mature themes.",
          backgroundColor: Colors.grey.withOpacity(0.8),
          foregroundColor: Colors.white,
          icon: TablerIcons.circle_letter_n,
        );
    }
  }

  // Relationship Type Information
  static RatingInfo getRelationshipInfo(
    BuildContext context,
    RelationshipType type,
  ) {
    switch (type) {
      case RelationshipType.FEM_SLASH:
        return RatingInfo(
          symbol: "F/F",
          label: "Female/Female Relationships",
          description:
              "This work focuses on romantic or sexual relationships between women.",
          information:
              "F/F (or Femslash) works center on romantic and/or sexual relationships between female characters. These stories range from sweet romance to more intense relationships, depending on the work's overall rating.\n\nCommon themes in F/F works include:\n• Coming out narratives\n• LGBTQ+ representation and community\n• Overcoming heteronormativity\n• Character exploration and development through queer relationships\n• Both canon F/F relationships and those created through fanfiction\n\nF/F content spans all genres including romance, drama, fantasy, sci-fi, and contemporary settings. The depth of the relationship focus varies widely from background elements to central storylines.",
          backgroundColor: Colors.pink.withOpacity(0.2),
          foregroundColor: Colors.pink,
          icon: TablerIcons.venus,
        );
      case RelationshipType.SLASH:
        return RatingInfo(
          symbol: "M/M",
          label: "Male/Male Relationships",
          description:
              "This work focuses on romantic or sexual relationships between men.",
          information:
              "M/M (or Slash) works feature romantic and/or sexual relationships between male characters. This category has a long history in fanfiction communities and represents one of the largest segments of fan works.\n\nM/M works often explore:\n• Coming out stories and identity development\n• LGBTQ+ themes and representation\n• Complex relationship dynamics\n• Character studies through the lens of same-sex attraction\n• Both canon gay relationships and fan-created pairings\n\nThe tone and content of M/M works vary dramatically based on the age rating, from innocent romance to explicit content in adult-rated works. M/M can be found across virtually every genre and fandom.",
          backgroundColor: Colors.blue.withOpacity(0.2),
          foregroundColor: Colors.blue,
          icon: TablerIcons.mars,
        );
      case RelationshipType.HET:
        return RatingInfo(
          symbol: "M/F",
          label: "Male/Female Relationships",
          description:
              "This work focuses on romantic or sexual relationships between men and women.",
          information:
              "M/F (or Het) works center on heterosexual relationships between male and female characters. These represent traditional romantic pairings found across literature, film, and other media.\n\nHet works include various relationship dynamics:\n• Traditional romance narratives\n• Established relationships and developing romances\n• Complex interplays of gender dynamics\n• Both canon heterosexual relationships and fan-created pairings\n\nThese works appear in all genres and can range from innocent romance to more mature content depending on the work's rating. Het relationships may be central to the plot or serve as supporting elements in a larger narrative.",
          backgroundColor: Colors.purple.withOpacity(0.2),
          foregroundColor: Colors.purple,
          icon: TablerIcons.gender_bigender,
        );
      case RelationshipType.GEN:
        return RatingInfo(
          symbol: "Gen",
          label: "General",
          description:
              "This work focuses on non-romantic relationships or has romance as a secondary element.",
          information:
              "Gen (General) works focus primarily on non-romantic elements such as friendship, family relationships, adventure, mystery, or character development. Romance, if present at all, is a minor subplot rather than the main focus.\n\nGen works typically feature:\n• Friendship and platonic relationships\n• Family bonds and dynamics\n• Character growth and personal journeys\n• Plot-driven narratives\n• Team or group dynamics\n\nGen works are ideal for readers who prefer stories without romantic entanglements or who enjoy adventure, mystery, or character studies where relationships aren't the central focus. These works often explore deep interpersonal connections that aren't romantic in nature.",
          backgroundColor: Colors.teal.withOpacity(0.2),
          foregroundColor: Colors.teal,
          icon: TablerIcons.article,
        );
      case RelationshipType.MULTI:
        return RatingInfo(
          symbol: "Multi",
          label: "Multiple Pairings",
          description:
              "This work contains various relationship types or polyamorous relationships.",
          information:
              "Multi works feature multiple significant relationships that may include any combination of F/F, M/M, and M/F pairings. This category also includes polyamorous relationships where characters form connections with multiple partners.\n\nMulti works often explore:\n• Complex interpersonal dynamics\n• Ensemble casts with various romantic connections\n• Polyamory and ethical non-monogamy\n• Love triangles, quadrangles, or more complex arrangements\n• Character development through diverse relationship experiences\n\nThese works typically have richer relationship webs than those focusing on a single pairing. Multi works may present relationships sequentially or concurrently, and can include both romantic and sexual content depending on the age rating.",
          backgroundColor: Colors.amber.withOpacity(0.2),
          foregroundColor: Colors.amber,
          icon: TablerIcons.users_group,
        );
      case RelationshipType.OTHER:
        return RatingInfo(
          symbol: "Other",
          label: "Other Relationships",
          description:
              "This work contains relationships that don't fit the standard categories.",
          information:
              "Works tagged as Other Relationships include pairings that don't fit neatly into standard relationship categories. This might include relationships involving non-binary characters, genderfluid characters, or other gender expressions outside the binary.\n\nOther Relationships may include:\n• Relationships involving non-binary, genderqueer, or genderfluid characters\n• Relationships with otherworldly beings, AI, or non-human entities\n• Complex relationships that defy simple categorization\n• Experimental relationship structures\n• Relationships that explore or challenge gender norms\n\nThese works often provide representation for identities and relationships that are less commonly depicted in mainstream media, offering important diversity in character and relationship representation.",
          backgroundColor: Colors.grey.withOpacity(0.2),
          foregroundColor: Colors.grey,
          icon: TablerIcons.dots,
        );
      default:
        return RatingInfo(
          symbol: "N/A",
          label: "Unknown Relationship",
          description:
              "The relationship type for this work hasn't been specified.",
          information:
              "When a work has an Unknown Relationship type, the author has not provided clear information about what kinds of relationships are featured in the story.\n\nThis could mean:\n• The work may not focus on relationships at all\n• The author chose not to categorize the relationships present\n• The work might contain any type of relationship content\n• The relationships may evolve or change throughout the story\n\nReaders should check the work's tags or summary for additional clues about relationship content. Without specific relationship tags, the work may focus more on plot, character development, or themes rather than romantic or sexual relationships.",
          backgroundColor: Colors.grey.withOpacity(0.2),
          foregroundColor: Colors.grey,
          icon: TablerIcons.question_mark,
        );
    }
  }

  // Warning Type Information
  static RatingInfo getWarningInfo(BuildContext context, WarningType warning) {
    switch (warning) {
      case WarningType.APPLICABLE:
        return RatingInfo(
          symbol: "CW",
          label: "Content Warnings Apply",
          description:
              "This work contains potentially disturbing content. Check the tags for specifics.",
          information:
              "Content Warnings Apply indicates that the work contains content that some readers may find disturbing, triggering, or otherwise problematic.\n\nImportant reader guidance:\n• Check the work's tags carefully before reading\n• The author has acknowledged that the content could be triggering for some readers\n• The specific warnings may include any combination of archive warnings\n• Additional content warnings may be mentioned in author notes\n\nThis warning serves as a general alert that sensitive content exists in the work. Readers with specific triggers or content concerns should review all available tags and notes before proceeding. The author has chosen to be transparent about potentially disturbing elements.",
          backgroundColor: Colors.red.withOpacity(0.2),
          foregroundColor: Colors.red,
          icon: TablerIcons.alert_triangle,
        );
      case WarningType.AUTHOR_DEFERRED:
        return RatingInfo(
          symbol: "?",
          label: "Author Chose Not To Warn",
          description:
              "The author has opted not to specify warnings. Any content may be present.",
          information:
              "When an author chooses not to warn, they have deliberately withheld information about potentially sensitive content. This is different from \"No Content Warnings\" and should be approached with caution.\n\nThis choice may indicate:\n• The author wants to avoid spoilers that warnings would reveal\n• The work might contain any of the major archive warnings (graphic violence, major character death, rape/non-con, or underage content)\n• The author prefers readers approach the work without preconceptions\n• The content may contain surprises or twists that warnings would reveal\n\nReaders sensitive to specific content should approach these works with caution. \"Author Chose Not To Warn\" means you should be prepared for potentially any type of mature or triggering content.",
          backgroundColor: Colors.amber.withOpacity(0.2),
          foregroundColor: Colors.amber,
          icon: TablerIcons.alert_circle,
        );
      case WarningType.NOT_APPLICABLE:
        return RatingInfo(
          symbol: "✓",
          label: "No Content Warnings",
          description:
              "This work doesn't contain content requiring standard archive warnings.",
          information:
              "No Content Warnings means the author has confirmed that the work does NOT contain content requiring standard archive warnings. This is a positive indication of content safety regarding specific concerning elements.\n\nSpecifically, the work does not contain:\n• Graphic depictions of violence\n• Major character death\n• Rape or non-consensual sexual content\n• Sexual content involving underage characters\n\nThis doesn't mean the work contains no mature themes whatsoever, but it guarantees the absence of the most commonly triggering content types. Readers concerned about these specific triggers can proceed with confidence, though the work's general age rating (General, Teen, Mature, Explicit) should still be considered.",
          backgroundColor: Colors.green.withOpacity(0.2),
          foregroundColor: Colors.green,
          icon: TablerIcons.check,
        );
      case WarningType.GRAPHIC_VIOLENCE:
        return RatingInfo(
          symbol: "GV",
          label: "Graphic Violence",
          description:
              "This work contains explicit depictions of violence or gore.",
          information:
              "The Graphic Violence warning indicates that the work contains explicit, detailed descriptions or depictions of violence, blood, gore, or bodily harm that go beyond brief or mild references.\n\nContent may include:\n• Detailed descriptions of injuries, wounds, or torture\n• Explicit combat or fight scenes with graphic outcomes\n• Vivid depictions of bodily harm or disfigurement\n• Scenes focusing on blood, gore, or visceral physical damage\n• Violence that is central to the narrative rather than incidental\n\nThis warning is applied when the violent content is presented in a way that creates vivid mental images and may be disturbing or triggering for sensitive readers. The intensity typically exceeds what would be found in a PG-13 movie.",
          backgroundColor: Colors.red.withOpacity(0.2),
          foregroundColor: Colors.red,
          icon: TablerIcons.sword,
        );
      case WarningType.MAJOR_CHARACTER_DEATH:
        return RatingInfo(
          symbol: "MCD",
          label: "Major Character Death",
          description:
              "This work involves the death of one or more major characters.",
          information:
              "Major Character Death means that one or more significant characters die during the course of the story. This warning helps readers prepare emotionally for potential loss of beloved characters.\n\nThis warning applies when:\n• A viewpoint character dies\n• A character central to the plot dies\n• A death significantly impacts the narrative and other characters\n• The death is permanent (not temporarily reversed)\n\nThis warning is provided to help readers who find character death particularly upsetting or who prefer to avoid works with tragic outcomes for main characters. The warning doesn't specify which character dies, as that would constitute a major spoiler, but confirms that at least one important character does not survive.",
          backgroundColor: Colors.red.withOpacity(0.2),
          foregroundColor: Colors.red,
          icon: TablerIcons.skull,
        );
      case WarningType.RAPE_NON_CONSENSUAL:
        return RatingInfo(
          symbol: "R/NC",
          label: "Rape/Non-Con",
          description:
              "This work contains depictions of non-consensual sexual activities.",
          information:
              "The Rape/Non-Con warning indicates that the work contains depictions or descriptions of sexual acts occurring without explicit consent from all participants. This is one of the most serious content warnings.\n\nThis warning covers:\n• Explicit rape scenes or sexual assault\n• Dubious consent situations where consent is unclear or compromised\n• Sexual activities under coercion or threat\n• Non-consensual sexual touching or violations\n• Sexual content where a participant cannot give meaningful consent (due to intoxication, power imbalance, etc.)\n\nThis warning is provided for readers who find such content traumatizing or disturbing. The presence of this warning does not indicate the author condones such actions; often these works explore trauma, recovery, or complex psychological themes.",
          backgroundColor: Colors.red.withOpacity(0.2),
          foregroundColor: Colors.red,
          icon: TablerIcons.lock,
        );
      case WarningType.UNDERAGE:
        return RatingInfo(
          symbol: "U",
          label: "Underage Sex",
          description:
              "This work depicts sexual activity involving characters under 18.",
          information:
              "The Underage warning indicates that the work contains sexual content involving characters who are under 18 years of age. This warning exists regardless of the context or how the content is presented.\n\nThis warning applies when:\n• Sexual or romantic content involves anyone under 18\n• Sexual themes are explored with underage characters\n• Sexual situations occur between characters where at least one is a minor\n• Content depicts sexuality developing during adolescence\n\nThe presence of this warning doesn't necessarily mean the content is explicit, as even non-explicit sexual content involving minors receives this warning. This warning helps readers make informed choices about content involving younger characters in sexual situations, regardless of how the author presents these elements.",
          backgroundColor: Colors.red.withOpacity(0.2),
          foregroundColor: Colors.red,
          icon: TablerIcons.number_18_small,
        );
      default:
        return RatingInfo(
          symbol: "?",
          label: "Unknown Warning Status",
          description: "Warning information for this work is unavailable.",
          information:
              "When a work has Unknown Warning Status, the system couldn't determine what content warnings may apply. This is different from \"Author Chose Not To Warn\" - this is a technical limitation rather than an author's choice.\n\nThis status may occur when:\n• The work's metadata is incomplete or corrupted\n• The work was imported without proper warning tags\n• There was an error in processing the warning information\n• The work uses non-standard warning conventions\n\nReaders should approach these works with caution, as any type of content might be present without warning. Check author notes, comments, or tags for possible hints about content, or contact the author directly if you have specific concerns.",
          backgroundColor: Colors.grey.withOpacity(0.2),
          foregroundColor: Colors.grey,
          icon: TablerIcons.question_mark,
        );
    }
  }
}

/// Data class containing information about a rating
class RatingInfo {
  final String symbol;
  final String label;
  final String description;
  final String information;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;

  const RatingInfo({
    required this.symbol,
    required this.label,
    required this.description,
    this.information = "",
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
  });
}
