using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Notes.Domain;


namespace Notes.Persistence.EntityTypeConfigurations
{
    internal class NoteConfiguration : IEntityTypeConfiguration<Note>
    {
        public void Configure(EntityTypeBuilder<Note> buildre)
        {
            buildre.HasKey(note => note.Id);
            buildre.HasIndex(note => note.Id).IsUnique();
            buildre.Property(note => note.Title).HasMaxLength(250);

        }
    }
}
